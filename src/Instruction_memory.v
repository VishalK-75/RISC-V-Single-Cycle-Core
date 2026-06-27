module Instr_memory(rst,A,RD);
    input rst;
    input [31:0] A;
    output [31:0] RD;
    
    reg [31:0] Mem [1023:0];
    
    assign RD = (rst == 1'b1) ? 32'h00000000 : Mem[A[31:2]];  
    
    integer i;
    initial begin
       for (i = 0; i < 1024; i = i + 1) begin
           Mem[i] = 32'h00000013; 
        end
        $readmemh("E:/RISC_V Single Cycle Core/RISC_V Single Cycle Core/memfile.txt",Mem); 
    end
endmodule
