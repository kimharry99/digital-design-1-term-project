module termProject(
	input [15:0] SW,
	output reg [0:6] HEX7,HEX6,HEX5,HEX4
	);
	reg [3:0]data_in1, data_in2,data_in3,data_in4;
	parameter Seg9 = 7'b000_1100; 
	parameter Seg8 = 7'b000_0000; 
	parameter Seg7 = 7'b000_1111; 
	parameter Seg6 = 7'b010_0000; 
	parameter Seg5 = 7'b010_0100;
	parameter Seg4 = 7'b100_1100; 
	parameter Seg3 = 7'b000_0110; 
	parameter Seg2 = 7'b001_0010; 
	parameter Seg1 = 7'b100_1111; 
	parameter Seg0 = 7'b000_0001;
	parameter SegX = 7'b111_1111;

	always @(*)
	begin
	data_in1 = SW[15:12];
	data_in2 = SW[11:8];
	data_in3 = SW[7:4];
	data_in4 = SW[3:0];
	end
	always @(*)
	begin
		case(data_in1)
			9: HEX7 = Seg9;
			8: HEX7 = Seg8;
			7: HEX7 = Seg7;
			6: HEX7 = Seg6;
			5: HEX7 = Seg5;
			4: HEX7 = Seg4;
			3: HEX7 = Seg3;
			2: HEX7 = Seg2;
			1: HEX7 = Seg1;
			0: HEX7 = Seg0;
			default: HEX7 = SegX;
		endcase
		case(data_in2)
			9: HEX6 = Seg9;
			8: HEX6 = Seg8;
			7: HEX6 = Seg7;
			6: HEX6 = Seg6;
			5: HEX6 = Seg5;
			4: HEX6 = Seg4;
			3: HEX6 = Seg3;
			2: HEX6 = Seg2;
			1: HEX6 = Seg1;
			0: HEX6 = Seg0;
			default: HEX6 = SegX;
		endcase
		case(data_in3)
			9: HEX5 = Seg9;
			8: HEX5 = Seg8;
			7: HEX5 = Seg7;
			6: HEX5 = Seg6;
			5: HEX5 = Seg5;
			4: HEX5 = Seg4;
			3: HEX5 = Seg3;
			2: HEX5 = Seg2;
			1: HEX5 = Seg1;
			0: HEX5 = Seg0;
			default: HEX5 = SegX;
		endcase
		case(data_in4)
			9: HEX4 = Seg9;
			8: HEX4 = Seg8;
			7: HEX4 = Seg7;
			6: HEX4 = Seg6;
			5: HEX4 = Seg5;
			4: HEX4 = Seg4;
			3: HEX4 = Seg3;
			2: HEX4 = Seg2;
			1: HEX4 = Seg1;
			0: HEX4 = Seg0;
			default: HEX4 = SegX;
		endcase
	end
	
endmodule
