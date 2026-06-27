

module Single_Cycle_Top(clk,rst);
    input clk,rst;
    
    wire [31:0] PC_Top, RD_Instr, RD1_Top, RD2_Top, Imm_Ext_Top, ALUResult, ReadData, PCPlus4, SrcB, Result;
    wire RegWrite, MemWrite, ALUSrc, ResultSrc;
    wire [1:0] ImmSrc;
    wire [2:0]  ALUControl_Top;
    
    PC PC( .rst(rst), 
           .clk(clk), 
           .PC(PC_Top), 
           .PC_Next(PCPlus4));
    PC_Adder PC_Adder(
            .a(PC_Top),
            .b(32'd4),
            .c(PCPlus4));   
    Instr_memory Instruction_memory( 
            .rst(rst), 
            .A(PC_Top), 
            .RD(RD_Instr));
    Register_file Register_file(
            .clk(clk), 
            .rst(rst), 
            .WE3(RegWrite), 
            .WD3(Result), 
            .A1(RD_Instr[19:15]), 
            .A2(RD_Instr[24:20]), 
            .A3(RD_Instr[11:7]), 
            .RD1(RD1_Top), 
            .RD2(RD2_Top));
     Mux Mux_Reg_to_ALU(
            .a(RD2_Top),
            .b(Imm_Ext_Top), 
            .s(ALUSrc),
            .c(SrcB));  
     Sign_Extend Sign_Extend(
            .In(RD_Instr),
            .ImmSrc(ImmSrc[0]),
            .Imm_Ext(Imm_Ext_Top));
     ALU ALU(
            .A(RD1_Top),
            .B(SrcB),
            .ALUControl(ALUControl_Top),
            .Result(ALUResult),
            .N(),
            .C(),
            .Z(),
            .V());
     Control_Unit_Top Control_Unit_Top(
            .funct3(RD_Instr[14:12]),
            .funct7(),
            .ALUControl(ALUControl_Top),
            .Op(RD_Instr[6:0]),
            .RegWrite(RegWrite),
            .Branch(),
            .MemWrite(MemWrite),
            .ImmSrc(ImmSrc),
            .ALUSrc(ALUSrc),
            .ResultSrc(ResultSrc));
     Data_Memory Data_Memory(
            .A(ALUResult),
            .clk(clk),
            .rst(rst),
            .WD(RD2_Top),
            .WE(MemWrite),
            .RD(ReadData));
     Mux Mux_DataMem_to_Reg(
            .a(ALUResult),
            .b(ReadData), 
            .s(ResultSrc),
            .c(Result));  
endmodule
