`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:27 09/06/2021 
// Design Name: 
// Module Name:    Digital_Clock 
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
module Digital_Clock(
    input clk,
    input rst,
    output reg [6:0] SSD,
    output reg [3:0] EN
    );

wire clk1hz;	 
reg [3:0]S0,S1,S2,S3,S4,S5;
reg [15:0]counter = 16'd0;
wire [6:0]SSD0,SSD1,SSD2,SSD3,SSD4,SSD5;


SevenSegmentDecoder x0(S0,SSD0);
SevenSegmentDecoder x1(S1,SSD1);
SevenSegmentDecoder x2(S2,SSD2);
SevenSegmentDecoder x3(S3,SSD3);
SevenSegmentDecoder x4(S4,SSD4);
SevenSegmentDecoder x5(S5,SSD5);
clk1hz x6(clk,clk1hz);

always@(posedge clk1hz)
begin

if (rst == 1'd1)
begin
S0 <= 4'd0;
S1 <= 4'd0;
S2 <= 4'd0;
S3 <= 4'd0;
S4 <= 4'd0;
S5 <= 4'd0;
end

else 
begin
S0 <= S0+1;
		if (S0 == 4'd9)
		begin
		S0 <= 4'd0;
		S1 <= S1+1;
		
		if (S1 == 4'd5)
		begin
		S1 <= 4'd0;
		S2 <= S2+1;
		
		if (S2 == 4'd9)
		begin
		S2 <= 4'd0;
		S3 <= S3+1;
		
		if (S3 == 4'd5)
		begin
		S3 <= 4'd0;
		S4 <= S4+1;
		
		if ((S4 == 4'd3) && (S5 ==4'd2)) 
		begin
		S4 <= 4'd0;
		S5 <= 4'd0;
		end
		
		if (S4 == 4'd9)
		begin
		S4 <= 4'd0;
		S5 <= S5+1;
		
		if (S4 == 4'd2)
		begin
		S5 <= 4'd0;
		
		end 
		end
		end 
		end 
		end 
		end 
		
end
end


//enable shifting
always@(posedge clk)
begin
counter <= counter + 16'd1;

case(counter[15:14])
3'b00 : begin 
					EN = 4'b1110;
               SSD = SSD0; 
			end
3'b01 : begin 
					EN = 4'b1101;
               SSD = SSD1; 
			end			
3'b10 : begin 
					EN = 4'b1011;
               SSD = SSD2; 
			end
3'b11 : begin 
					EN = 4'b0111;
               SSD = SSD3; 
			end
default :   EN = 6'b1111;
                
		


			
endcase

end



endmodule
