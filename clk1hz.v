`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:19:13 07/10/2021 
// Design Name: 
// Module Name:    clk1hz 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clk1hz(
    input clkin,
    output clkout
    );
	 
integer counter;
reg freq;

initial
begin 
counter = 0;
freq = 1'b0;
end

always@(posedge clkin)
begin

counter = counter + 1;

if (counter == 50000000)
begin
freq <= ~freq;
counter <= 1'b0;
end

end

assign clkout = freq;

endmodule
