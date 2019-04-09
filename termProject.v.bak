module termProject(
	input [16:0] SW,
	output reg [0:6] HEX7,HEX6,HEX5,HEX4,HEX1,HEX0,
	output reg [8:0] LEDG
	);
	wire [3:0]result_out1,result_out2;
	wire car1,overflow_underflow;
	reg [3:0]data_in1, data_in2,data_in3,data_in4;
	reg operator;
	parameter Seg9 = 7'b000_1100; parameter Seg8 = 7'b000_0000; parameter Seg7 = 7'b000_1111; 
	parameter Seg6 = 7'b010_0000; parameter Seg5 = 7'b010_0100;	parameter Seg4 = 7'b100_1100; 
	parameter Seg3 = 7'b000_0110; parameter Seg2 = 7'b001_0010; parameter Seg1 = 7'b100_1111; 
	parameter Seg0 = 7'b000_0001; parameter SegX = 7'b111_1111;
	
	bcd_8bit_subtractor(overflow_underflow,result_out1,result_out2,operator,data_in1,data_in2,data_in3,data_in4);
	always @(*)
	begin
	data_in1 = SW[15:12];
	data_in2 = SW[11:8];
	data_in3 = SW[7:4];
	data_in4 = SW[3:0];
	operator = SW[16];
	end
	
	//display data at hex
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
		LEDG[8]=overflow_underflow;
		if(overflow_underflow==0)
		begin
			case(result_out2)
				9: HEX0 = Seg9;
				8: HEX0 = Seg8;
				7: HEX0 = Seg7;
				6: HEX0 = Seg6;
				5: HEX0 = Seg5;
				4: HEX0 = Seg4;
				3: HEX0 = Seg3;
				2: HEX0 = Seg2;
				1: HEX0 = Seg1;
				0: HEX0 = Seg0;
				default: HEX0 = SegX;
			endcase
			case(result_out1)
				9: HEX1 = Seg9;
				8: HEX1 = Seg8;
				7: HEX1 = Seg7;
				6: HEX1 = Seg6;
				5: HEX1 = Seg5;
				4: HEX1 = Seg4;
				3: HEX1 = Seg3;
				2: HEX1 = Seg2;
				1: HEX1 = Seg1;
				0: HEX1 = Seg0;
				default: HEX1 = SegX;
			endcase
		end
		else
		begin
		HEX1 = SegX;
		HEX0 = SegX;
		end
	end
	
endmodule

module bcd_8bit_adder(overflow,sum_10,sum_1,operator,in1_10,in1_1,in2_10,in2_1);
	output overflow;
	output[3:0]sum_10,sum_1;
	input operator;
	input[3:0]in1_10,in1_1,in2_10,in2_1;
	wire[3:0] temp_sum_10,temp_sum_1,bit_4_operator;
	wire car1,temp_overflow;
	
	assign bit_4_operator[3]=operator;
	assign bit_4_operator[2]=operator;
	assign bit_4_operator[1]=operator;
	assign bit_4_operator[0]=operator;
	
	bcd_adder(car1,temp_sum_1,in1_1,in2_1,1'b0);
	bcd_adder(temp_overflow,temp_sum_10,in1_10,in2_10,car1);
	
	assign overflow=temp_overflow&~operator;
	assign sum_10 = temp_sum_10&~bit_4_operator;
	assign sum_1 = temp_sum_1&~bit_4_operator;
	
endmodule

module bcd_8bit_subtractor(underflow,sub_10,sub_1,operator,in1_10,in1_1,in2_10,in2_1);
    output underflow;
    reg underflow;
    output[3:0]sub_10,sub_1;
    input operator;
    input[3:0]in1_10,in1_1,in2_10,in2_1;
    wire[3:0]temp_sub_10,temp_sub_1,bit_4_operator;
    wire[3:0]temp_tens_complement_in2_10,temp_tens_complement_in2_1;
    wire notunderflow;
    
    assign bit_4_operator[3]=operator;
	assign bit_4_operator[2]=operator;
	assign bit_4_operator[1]=operator;
	assign bit_4_operator[0]=operator;
	
    tens_complement(temp_tens_complement_in2_10,temp_tens_complement_in2_1,in2_10,in2_1);
    bcd_8bit_adder(notunderflow,temp_sub_10,temp_sub_1,1'b0,in1_10,in1_1,temp_tens_complement_in2_10,temp_tens_complement_in2_1);
    
    always@(*)
    begin
	if(temp_tens_complement_in2_10==4'b0000&&temp_tens_complement_in2_1==4'b0000)
		underflow = 0;
	else
		underflow=~notunderflow&operator;
    end
    assign sub_10 = temp_sub_10&bit_4_operator;
	assign sub_1 = temp_sub_1&bit_4_operator; 
    
endmodule
module bcd_adder(carout, result, in1,in2,cin);
	output carout;
	output [3:0]result;
	input [3:0] in1, in2;
	input cin;
	
	wire car1,car2;
	wire [3:0] sum1,temp_addend; //result binary data
	
	full_adder fulladd1(sum1,car1,in1,in2,cin);
	assign carout = (sum1[3]&sum1[2])|(sum1[3]&sum1[1])|car1;
	assign temp_addend[0]=0;
	assign temp_addend[1]=carout;
	assign temp_addend[2]=carout;
	assign temp_addend[3]=0;
	full_adder fulladd2(result,car2,temp_addend,sum1,1'b0);
endmodule

module full_adder(sum,car, a, b, cin);
	output [3:0] sum;
	output car;
	input [3:0] a, b;
	input cin;
	wire [2:0] c;

	assign sum[0]=a[0] ^ b[0] ^ cin;
	assign c[0]=((a[0] ^ b[0]) & cin) | (a[0] & b[0]);

	assign sum[1]=a[1] ^ b[1] ^ c[0];
	assign c[1]=((a[1] ^ b[1]) & c[0]) | (a[1] & b[1]);

	assign sum[2]=a[2] ^ b[2] ^ c[1];
	assign c[2]=((a[2] ^ b[2]) & c[1]) | (a[2] & b[2]);

	assign sum[3]=a[3] ^ b[3] ^ c[2];
	assign car=((a[3] ^ b[3]) & c[2]) | (a[3] & b[3]);

endmodule

module nines_complement(nines_c,in);
     output [3:0]nines_c;
     input [3:0]in;
     
     assign nines_c[3]=~in[3]&~in[2]&~in[1];
     assign nines_c[2]=in[2]&~in[1]|~in[2]&in[1];
     assign nines_c[1]=in[1];
     assign nines_c[0]=~in[0];
     
endmodule

module tens_complement(tens_c_10,tens_c_1,in_10,in_1);
    output [3:0] tens_c_10,tens_c_1;
    input [3:0] in_10,in_1;
    wire[3:0] nines_c_10,nines_c_1;
    wire car;

    nines_complement _9c1(nines_c_10,in_10);
    nines_complement _9c2(nines_c_1,in_1);
    bcd_8bit_adder add1(overflow, tens_c_10, tens_c_1, 0, nines_c_10,nines_c_1,4'b0000,4'b0001);
    
endmodule