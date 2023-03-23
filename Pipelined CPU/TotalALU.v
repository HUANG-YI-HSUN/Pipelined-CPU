module TotalALU( clk, dataA, dataB, Signal, Output, reset, zero );
input reset ;
input clk ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [31:0] Output ;
output zero;
reg [6:0] counter = 7'd0 ;
reg [5:0] StdSignal = 6'd0 ; 
reg [31:0] StddataA, StddataB, temp ; 

//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SRL  : 2
//   SLT  : 42
//   DIVU : 27



parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;

parameter SRL = 6'b000010;

parameter DIVU= 6'b011011;
parameter MFHI= 6'b010000;
parameter MFLO= 6'b010010;

wire [5:0]  SignaltoALU ;
wire [5:0]  SignaltoSHT ;
wire [5:0]  SignaltoDIV ;
wire [5:0]  SignaltoMUX ;
wire [31:0] ALUOut, HiOut, LoOut, ShifterOut ;
wire [31:0] dataOut ;
wire [63:0] DivAns ;

reg switch = 1'b0 ;

always @ ( Signal or dataA or dataB ) begin
	if( Signal == 6'd27 ) begin
		switch = 1'b1 ;
		StddataA = dataA ;
		StddataB = dataB ;
	end
	else  begin
		StdSignal = Signal ;
		if( Signal == 6'd2 )begin
			StddataA = dataB ;
			StddataB = dataA ;
		end
	end
	
end
always @ ( posedge clk ) begin
	if( switch == 1'b1 ) begin
		StdSignal = 6'd27 ;
		counter = counter + 1 ;
	end
	if ( counter == 36 )begin
		 switch = 0 ;
		 counter = 7'd0 ;
		 StdSignal = 6'd0 ;
	end
	
end
ALUControl ALUControl( .clk(clk), .Signal(StdSignal), .SignaltoALU(SignaltoALU), .SignaltoSHT(SignaltoSHT), .SignaltoDIV(SignaltoDIV), .SignaltoMUX(SignaltoMUX) );
My_ALU ALU( .dataA(dataA), .dataB(dataB), .Signal(SignaltoALU), .dataOut(ALUOut), .reset(reset) );
Division_Hardware Divider( .clk(clk), .dataA(StddataA), .dataB(StddataB), .Signal(SignaltoDIV), .dataOut(DivAns), .reset(reset) );
My_Shifter Shifter( .dataA(StddataA), .dataB(StddataB), .Signal(SignaltoSHT), .dataOut(ShifterOut), .reset(reset) );
My_HiLo HiLo( .clk(clk), .DivAns(DivAns), .HiOut(HiOut), .LoOut(LoOut), .reset(reset) );
My_MUX MUX( .ALUOut(ALUOut), .HiOut(HiOut), .LoOut(LoOut), .Shifter(ShifterOut), .Signal(SignaltoMUX), .dataOut(dataOut) );
assign Output = ( Signal == 6'd0 ) ? 32'hzzzzzzzz : dataOut ;
assign zero = ( Output == 32'd0 ) ? 1 : 0 ;



endmodule