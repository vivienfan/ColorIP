`timescale 1ns / 1ps

module ColorDetect(
    input RESET,
    input CLK,
    input EN,
    input [23:0] DATA_IN,
    input [1:0] COLOR,
    output [13:0] ADDR,
    output [31:0] COORDINATE,
    output READY
    );
    
    reg ready;
    integer x, y;
    integer x_sum, y_sum, counter;
    
    always @(negedge RESET)
    begin
        x <= 0;
        y <= 0;
        x_sum <= 0;
        y_sum <= 0;
        counter <= 0;
        counter <= 0;
        ready <= 1'b0;
    end
    
    always @(EN == 1'b0)
    begin
        x <= 0;
        y <= 0;
        x_sum <= 0;
        y_sum <= 0;
        counter <= 0;
        counter <= 0;
        ready <= 1'b0;
    end
    
    always @(posedge CLK && EN && !ready)
    begin
         // read pixel
         case (COLOR)
         2'b00 :     // red
             if ( DATA_IN[23:16] >= 180     // R
                && DATA_IN[15:8] <= 80      // G
                 && DATA_IN[7:0] <= 80 )    // B
             begin     
                 x_sum <= x_sum + x - 1;
                 y_sum <= y_sum + y;
                 counter <= counter + 1;
             end
        2'b01 :     // green
            if ( DATA_IN[23:16] < 80      // R
               && DATA_IN[15:8] > 180     // G
                && DATA_IN[7:0] < 80 )    // B
            begin     
                x_sum <= x_sum + x - 1;
                y_sum <= y_sum + y;
                counter <= counter + 1;
            end
        2'b10 :     // blue
            if ( DATA_IN[23:16] < 80      // R
               && DATA_IN[15:8] < 80      // G
                && DATA_IN[7:0] > 180 )   // B
            begin     
                x_sum <= x_sum + x - 1;
                y_sum <= y_sum + y;
                counter <= counter + 1;
            end
        2'b11 :     // yellow
            if ( DATA_IN[23:16] > 200     // R
               && DATA_IN[15:8] > 200     // G
                && DATA_IN[7:0] < 80 )    // B
            begin     
                x_sum <= x_sum + x - 1;
                y_sum <= y_sum + y;
                counter <= counter + 1;
            end                 
        endcase
            
        // increment x and y
        // to get new pixel
        if( x == 96 && y == 56 ) begin // should be -> if( x == 1276 && y == 716 ) begin   // max, reset everything
            ready <= 1'b1;            
        end 
        else begin                
            if ( x == 96 ) begin
                x <= 0;
                y <= y + 4;  // if + 4 -> get a sample pixels for every 4 lines in a frame
            end else
                x <= x + 4;  // if + 4 -> get a sample pixel for every 4 pixels in a line
        end  
    end  
    
    assign ADDR = x + y*100;    // should be 1280
    assign COORDINATE[31:16] = x_sum / counter; // need rounding here
    assign COORDINATE[15:0] = y_sum / counter;  // need rounding here
    assign READY = ready;
    
endmodule
