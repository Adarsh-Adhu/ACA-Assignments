`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2022 17:11:23
// Design Name: 
// Module Name: Mux4into1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder3to8(
input [2:0]i,
    input en,
    output reg [7:0]out
    );
    always @ (i or en)
    begin
    if (en == 1)
    begin
        out = 8'b0;
        case (i)
            3'b000: out[0] <= 1'b1;
            3'b001: out[1] <= 1'b1;
            3'b010: out[2] <= 1'b1;
            3'b011: out[3] <= 1'b1;
            3'b100: out[4] <= 1'b1;
            3'b101: out[5] <= 1'b1;
            3'b110: out[6] <= 1'b1;
            3'b111: out[7] <= 1'b1;            
        endcase
    end
    else
        out = 8'b0;    
    end

endmodule
