
module My_MUX( ALUOut, HiOut, LoOut, Shifter, Signal, dataOut );
input [31:0] ALUOut ;
input [31:0] HiOut ;
input [31:0] LoOut ;
input [31:0] Shifter ;
input [5:0] Signal ;
output [31:0] dataOut ;


parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;

parameter SRL = 6'b000010;

parameter DIVU= 6'b011011;
parameter MFHI= 6'b010000;
parameter MFLO= 6'b010010;

assign dataOut = ((Signal == 6'd36) || (Signal == 6'd37) || (Signal == 6'd32) || (Signal == 6'd34) || (Signal == 6'd42)) ? ALUOut : (Signal == 6'd2) ? Shifter : (Signal == 6'd16) ? HiOut : (Signal == 6'd18) ? LoOut : 32'd0 ;

endmodule 