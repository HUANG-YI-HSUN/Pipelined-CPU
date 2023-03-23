/*
	Title: Register File (32 32-bit registers)
	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
	
	Input Port
		1. clk
		2. RegWrite: 控制暫存器是否可寫入
		3. RN1: rs欲讀取的暫存器編號
		4. RN2: rt欲讀取的暫存器編號
		5. WN: 欲寫入的暫存器編號
		6. WD: 寫入暫存器的資料
	Output Port
		1. RD1: rs暫存器所讀取的資料
		2. RD2: rt暫存器所讀取的資料
*/
module id_ex( clk, pi1_incr, rd1, rd2, extend_immed, rd, rt, wb, m, ex, pi2_incr, pi2_rd1, pi2_rd2, pi2_extend_immed, pi2_rd, pi2_rt, pi2_wb, pi2_m, pi2_ex, pi1_jump_addr, pi2_jump_addr, ForJump, 
              ForJump1, rst );
	input clk, rst, ForJump ;
	input[31:0] pi1_incr, rd1, rd2, extend_immed, pi1_jump_addr;
	input[4:0] rd, rt ;
	input[1:0] wb ;
	input[2:0] m ;
	input[3:0] ex ;
	
	output[31:0] pi2_incr, pi2_rd1, pi2_rd2, pi2_extend_immed, pi2_jump_addr;
	output[4:0] pi2_rd, pi2_rt ;
	output[1:0] pi2_wb ;
	output[2:0] pi2_m ;
	output[3:0] pi2_ex ;
	output ForJump1 ;
	
	reg[31:0] pi2_incr, pi2_rd1, pi2_rd2, pi2_extend_immed, pi2_jump_addr;
	reg[4:0] pi2_rd, pi2_rt ;
	reg[1:0] pi2_wb ;
	reg[2:0] pi2_m ;
	reg[3:0] pi2_ex ;
	reg ForJump1 ;

    always @( posedge clk ) begin
        if ( rst ) begin
			pi2_incr <= 32'b0 ;
			pi2_rd1 <= 32'b0 ;
			pi2_rd2 <= 32'b0 ;
			pi2_extend_immed <= 32'b0 ;
			pi2_rd <= 5'b0 ;
			pi2_rt <= 5'b0 ;
			pi2_wb <= 2'b0 ;
			pi2_m <= 3'b0 ;
			pi2_ex <= 4'b0 ;
			pi2_jump_addr <= 32'b0 ;
			ForJump1 <= 1'b0 ;
		end
        else begin
			pi2_incr <= pi1_incr ;
			pi2_rd1 <= rd1 ;
			pi2_rd2 <= rd2 ;
			pi2_extend_immed <= extend_immed ;
			pi2_rd <= rd ;
			pi2_rt <= rt ;
			pi2_wb <= wb ;
			pi2_m <= m ;
			pi2_ex <= ex ;
			pi2_jump_addr <= pi1_jump_addr;
			ForJump1 <= ForJump ;
		end
    end
	
endmodule
