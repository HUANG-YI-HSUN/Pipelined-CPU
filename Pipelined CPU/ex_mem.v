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
module ex_mem( clk, rst, pi3_add, pi4_add, pi3_zero, pi4_zero, pi3_alu, pi4_ADDR, pi3_rd2, pi4_WD, pi3_MUX, pi4_MUX, pi3_wb, pi4_wb, pi3_m, pi4_MemRead, pi4_MemWrite, pi4_Branch,
	       pi2_jump_addr, pi3_jump_addr, ForJump1, Jump, pi3_jr, jr );
	input clk, rst, pi3_zero, ForJump1, pi3_jr ;
	input[31:0] pi3_add, pi3_alu, pi3_rd2, pi2_jump_addr ;
	input[1:0] pi3_wb ;
	input[2:0] pi3_m ;
	input[4:0] pi3_MUX ;

	output pi4_zero, pi4_MemRead, pi4_MemWrite, pi4_Branch, Jump, jr ;
	output[31:0] pi4_add, pi4_ADDR, pi4_WD, pi3_jump_addr;
	output[1:0] pi4_wb ;
	output[4:0] pi4_MUX ;

	reg[31:0] pi4_add, pi4_ADDR, pi4_WD, pi3_jump_addr;
	reg[1:0] pi4_wb ;
	reg[4:0] pi4_MUX ;
	reg pi4_zero, pi4_MemRead, pi4_MemWrite, pi4_Branch, Jump, jr ;
	

	always @( posedge clk ) begin
        if ( rst ) begin
			pi4_add <= 32'b0 ;
			pi4_ADDR <= 32'b0 ;
			pi4_WD <= 32'b0 ;
			pi4_MUX <= 5'b0 ;
			pi4_wb <= 2'b0 ;
			pi4_MemRead <= 1'b0 ;
			pi4_MemWrite <= 1'b0 ;
			pi4_Branch <= 1'b0 ;
			pi4_zero <= 1'b0 ;
			Jump <= 1'b0 ;
			pi3_jump_addr <= 32'b0;
			jr <= 1'b0 ;
			
		end
        else begin
			pi4_add <= pi3_add ;
			pi4_ADDR <= pi3_alu ;
			pi4_WD <= pi3_rd2 ;
			pi4_MUX <= pi3_MUX ;
			pi4_wb <= pi3_wb ;
			pi4_MemRead <= pi3_m[0] ;
			pi4_MemWrite <= pi3_m[1] ;
			pi4_Branch <= pi3_m[2] ;
			pi4_zero <= pi3_zero ;
			Jump <= ForJump1 ;
			pi3_jump_addr <= pi2_jump_addr;
			jr <= pi3_jr ;
		end
    end
	
endmodule