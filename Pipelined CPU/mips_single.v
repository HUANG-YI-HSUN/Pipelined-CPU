//	Title: MIPS Single-Cycle Processor
//	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
module mips_single( clk, rst );
	input clk, rst;
	
	// instruction bus
	wire[31:0] instr;
	wire pi3_jr, jr ;
	// break out important fields from instruction
	wire [5:0] opcode, funct;
    wire [4:0] rs, rt, rd, shamt;
    wire [15:0] immed;
    wire [31:0] extend_immed, b_offset;
    wire [25:0] jumpoffset;
	
	// datapath signals
    wire [4:0] rfile_wn;
    wire [31:0] rfile_rd1, rfile_rd2, rfile_wd, alu_a, alu_b, alu_out, b_tgt, pc_next,
                pc, pc_incr, dmem_rdata, pi1_jump_addr, branch_addr,  pi2_jump_addr, pi1_incr, pc2_next, extend2_immed;

	// control signals
    wire RegWrite, Branch, PCSrc, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Zero, Jump, ForJump, ForJump1, srl_src, zero_extnd;
    wire [1:0] ALUOp;
    wire [5:0] Operation;
    wire [31:0] pi1_instr ;
    assign opcode = pi1_instr[31:26];
    assign rs = pi1_instr[25:21];
    assign rt = pi1_instr[20:16];
    assign rd = pi1_instr[15:11];
    assign shamt = pi1_instr[10:6];
    assign funct = pi1_instr[5:0];
    assign immed = pi1_instr[15:0];
    assign jumpoffset = instr[25:0];
    wire[25:0] pi1_jumpoffset ;
	
	// branch offset shifter
    wire [31:0] pi2_extend_immed, srl_extend ;
    assign b_offset = pi2_extend_immed << 2;
	assign srl_extend = { 27'd0, pi2_extend_immed[10:6] } ;
	
	// jump offset shifter & concatenation
	assign pi1_jump_addr = { pi1_incr[31:28], pi1_jumpoffset <<2 };
	assign extend2_immed[31:16] = zero_extnd ? 16'd0 : extend_immed[31:16] ;
	assign extend2_immed[15:0] = extend_immed[15:0] ;

	// pipeline1
	

	// pipeline2
	wire [4:0] pi2_rt, pi2_rd ;
	wire [1:0] pi2_wb, pi3_wb ;
	wire [2:0] pi2_m, pi3_m ;
	wire [3:0] pi2_e, pi3_e ;
	assign ALUOp = pi3_e[1:0] ;
	assign RegDst = pi3_e[2] ;
	assign ALUSrc = pi3_e[3] ;
	wire [31:0] pi2_incr, pi2_rd1, pi2_rd2;
	//wire [4:0] pi2_rd, pi2_rt ;
	
	// pipeline3
	wire [31:0] pi4_add, pi4_ADDR, pi4_WD, pi3_jump_addr;
	wire pi4_zero;
	wire [4:0] pi4_MUX ;
        wire [1:0] pi4_wb ;

	//pipeline4
	wire [31:0] pi5_MUX0, pi5_MUX1 ;
	wire [4:0] pi5_MUX ;
	
	// module instantiations
	reg32 PC( .clk(clk), .rst(rst), .en_reg(1'b1), .d_in(pc2_next), .d_out(pc) );
	// sign-extender
	sign_extend SignExt( .immed_in(immed), .ext_immed_out(extend_immed) );
	
	add32 PCADD( .a(pc), .b(32'd4), .result(pc_incr) ); // First pipeline

    add32 BRADD( .a(pi2_incr), .b(b_offset), .result(b_tgt) );

 
	
	TotalALU alu( .clk(clk), .dataA(alu_a), .dataB(alu_b), .Signal(Operation), .Output(alu_out), .reset(rst), .zero(Zero) ) ;
	
    and BR_AND(PCSrc, Branch, pi4_zero);

    mux2 #(5) RFMUX( .sel(RegDst), .a(pi2_rt), .b(pi2_rd), .y(rfile_wn) );

    mux2 #(32) PCMUX( .sel(PCSrc), .a(pc_incr), .b(pi4_add), .y(branch_addr) );
	
	mux2 #(32) JMUX( .sel(Jump), .a(branch_addr), .b(pi3_jump_addr), .y(pc_next) );
	
	mux2 #(32) JR( .sel(jr), .a(pc_next), .b(pi4_ADDR), .y(pc2_next) );
	
    mux2 #(32) ALUMUX( .sel(ALUSrc), .a(pi2_rd2), .b(pi2_extend_immed), .y(alu_b) );
	mux2 #(32) SRLMUX( .sel(srl_src), .a(pi2_rd1), .b(srl_extend), .y(alu_a) );
	
    mux2 #(32) WRMUX( .sel(MemtoReg), .a(pi5_MUX1), .b(pi5_MUX0), .y(rfile_wd) );

    control_single CTL(.opcode(opcode), .RegDst(pi2_e[2]), .ALUSrc(pi2_e[3]), .MemtoReg(pi2_wb[1]), 
                       .RegWrite(pi2_wb[0]), .MemRead(pi2_m[0]), .MemWrite(pi2_m[1]), .Branch(pi2_m[2]), 
                       .Jump(ForJump), .ALUOp(pi2_e[1:0]), .zero_extnd(zero_extnd));

    alu_ctl ALUCTL( .ALUOp(ALUOp), .Funct(pi2_extend_immed[5:0]), .ALUOperation(Operation), .pi3_jr(pi3_jr), .srl_src(srl_src) );
	

	reg_file RegFile( .clk(clk), .RegWrite(RegWrite), .RN1(rs), .RN2(rt), .WN(pi5_MUX), 
					  .WD(rfile_wd), .RD1(rfile_rd1), .RD2(rfile_rd2) );

	memory InstrMem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(instr) ); // First pipeline

	memory DatMem( .clk(clk), .MemRead(MemRead), .MemWrite(MemWrite), .wd(pi4_WD), 
				   .addr(pi4_ADDR), .rd(dmem_rdata) );	
	// --------------------------------------------------------------Pipeline-------------------------------------------------------------------

	id_if pipeline1( .clk(clk), .pc_incr(pc_incr), .instr(instr), .jumpoffset(jumpoffset), .pi1_incr(pi1_incr), .pi1_instr(pi1_instr), .pi1_jumpoffset(pi1_jumpoffset), .rst(rst) );
	
	id_ex pipeline2( .clk(clk), .pi1_incr(pi1_incr), .rd1(rfile_rd1), .rd2(rfile_rd2), .extend_immed(extend2_immed), .rd(pi1_instr[15:11]), .rt(pi1_instr[20:16]), .wb(pi2_wb), .m(pi2_m), .ex(pi2_e),
			 .pi2_incr(pi2_incr), .pi2_rd1(pi2_rd1), .pi2_rd2(pi2_rd2), .pi2_extend_immed(pi2_extend_immed), .pi2_rd(pi2_rd), .pi2_rt(pi2_rt), .pi2_wb(pi3_wb), .pi2_m(pi3_m), 
			 .pi2_ex(pi3_e), .pi1_jump_addr(pi1_jump_addr), .pi2_jump_addr(pi2_jump_addr), .ForJump(ForJump), .ForJump1(ForJump1),  .rst(rst) ) ;
			 
	ex_mem pipeline3( .clk(clk), .rst(rst), .pi3_add(b_tgt), .pi4_add(pi4_add), .pi3_zero(Zero), .pi4_zero(pi4_zero), .pi3_alu(alu_out), .pi4_ADDR(pi4_ADDR), 
			  .pi3_rd2(pi2_rd2), .pi4_WD(pi4_WD), .pi3_MUX(rfile_wn), .pi4_MUX(pi4_MUX), .pi3_wb(pi3_wb), .pi4_wb(pi4_wb), .pi3_m(pi3_m), .pi4_MemRead(MemRead), 
		          .pi4_MemWrite(MemWrite), .pi4_Branch(Branch), .pi2_jump_addr(pi2_jump_addr), .pi3_jump_addr(pi3_jump_addr), .ForJump1(ForJump1), .Jump(Jump), .pi3_jr(pi3_jr), .jr(jr)  );
				  
	mem_wb pipeline4( .clk(clk), .rst(rst), .pi3_wb(pi4_wb), .pi5_RegWrite(RegWrite), .pi5_MemtoReg(MemtoReg), .pi4_RD(dmem_rdata), .pi5_MUX0(pi5_MUX0), .pi3_ADDR(pi4_ADDR),
			  .pi5_MUX1(pi5_MUX1), .pi3_MUX(pi4_MUX), .pi5_MUX(pi5_MUX ) );
				   
endmodule
