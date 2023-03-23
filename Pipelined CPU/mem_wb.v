/*
	Title: Register File (32 32-bit registers)
	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
	
	Input Port
		1. clk
		2. RegWrite: ����Ȧs���O�_�i�g�J
		3. RN1: rs��Ū�����Ȧs���s��
		4. RN2: rt��Ū�����Ȧs���s��
		5. WN: ���g�J���Ȧs���s��
		6. WD: �g�J�Ȧs�������
	Output Port
		1. RD1: rs�Ȧs����Ū�������
		2. RD2: rt�Ȧs����Ū�������
*/
module mem_wb( clk, rst, pi3_wb, pi5_RegWrite, pi5_MemtoReg, pi4_RD, pi5_MUX0, pi3_ADDR, pi5_MUX1, pi3_MUX, pi5_MUX );
	input[1:0] pi3_wb ;
	input[31:0] pi4_RD, pi3_ADDR ;
	input[4:0] pi3_MUX ;
	input clk, rst ;

	output pi5_RegWrite, pi5_MemtoReg ;
	output[31:0] pi5_MUX0, pi5_MUX1 ;
	output[4:0] pi5_MUX ;
	
	reg pi5_RegWrite, pi5_MemtoReg ;
	reg[31:0] pi5_MUX0, pi5_MUX1 ;
	reg[4:0] pi5_MUX ;

	always @( posedge clk ) begin
        if ( rst ) begin
			pi5_MUX0 <= 32'b0 ;
			pi5_MUX1 <= 32'b0 ;
			pi5_MUX <= 5'b0 ;
			pi5_RegWrite <= 1'b0 ;
			pi5_MemtoReg <= 1'b0 ;
		end
        else begin
			pi5_MUX0 <= pi4_RD ;
			pi5_MUX1 <= pi3_ADDR ;
			pi5_MUX <= pi3_MUX ;
			pi5_RegWrite <= pi3_wb[0] ;
			pi5_MemtoReg <= pi3_wb[1];
		end
    end
	
endmodule