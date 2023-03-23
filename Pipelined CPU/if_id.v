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
module id_if( clk, pc_incr, instr, jumpoffset, pi1_incr, pi1_instr, pi1_jumpoffset, rst );
	input clk, rst ;
	input[25:0] jumpoffset ;
	input[31:0] pc_incr,instr ;
	output[25:0] pi1_jumpoffset ;
	output[31:0] pi1_incr, pi1_instr;
	reg[31:0] pi1_incr, pi1_instr;
	reg[25:0]  pi1_jumpoffset ;

    always @( posedge clk ) begin
        if ( rst ) begin
			pi1_incr <= 32'b0;
			pi1_instr <= 32'b0;
			pi1_jumpoffset <= 32'b0;
		end		
        else begin
			pi1_incr <= pc_incr ;
			pi1_instr <= instr ;
			pi1_jumpoffset <= jumpoffset;
		end
    end
	
endmodule
