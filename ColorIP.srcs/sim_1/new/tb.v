`timescale 1ns / 1ps


module tb( );
    reg reset;
    reg enable;
    reg sys_clk;
    wire[31:0] coord_r;
    wire[31:0] coord_g;
    wire[31:0] coord_b;
    wire[31:0] coord_y;
    wire ready_r;
    wire ready_g;
    wire ready_b;
    wire ready_y;
    
    design_1_wrapper dut
    (.RESET(reset),
     .EN(enable),
     .CLK(sys_clk),
     .COLOR_RED(2'b00),
     .COLOR_GREEN(2'b01),
     .COLOR_BLUE(2'b10),
     .COLOR_YELLOW(2'b11),
     .COORD_RED(coord_r),
     .COORD_GREEN(coord_g),
     .COORD_BLUE(coord_b),
     .COORD_YELLOW(coord_y),
     .READY_RED(ready_r),
     .READY_GREEN(ready_g),
     .READY_BLUE(ready_b),
     .READY_YELLOW(ready_y)
     );
     
     always #5 sys_clk = ~sys_clk;
         
     initial
        begin
            sys_clk = 1'b0;
            reset = 1'b1;
            enable = 1'b0;
            #2 enable = 1'b1;
        end
endmodule
