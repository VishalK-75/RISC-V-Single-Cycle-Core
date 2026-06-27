module Single_Cycle_Top_tb();
    reg clk=1'b0,rst;
    
    Single_Cycle_Top uut( .clk(clk), .rst(rst));
    
    initial begin
       $dumpfile("Single Cycle.vcd");
       $dumpvars(0);
    end
    
    always
    begin
      #50;
      clk=~clk;
    end
    
    initial
    begin
      rst = 1'b1;
      #100;
      
      rst = 1'b0;
      #1000;
      
      $finish;
    end
endmodule
