
module My_ALU( dataA, dataB, Signal, dataOut, reset );
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
input reset ;
output [31:0] dataOut ;
wire [31:0]temp ;
wire inv,set ;
wire [31:0] cout ;
//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SLT  : 42


assign inv = ( Signal == 6'd34 ) || ( Signal == 6'd42 ) ? 1'b1 : 1'b0 ;

assign dataOut = reset ? 32'd0 : temp ;
BitAlu	BitAlu1 (dataA[0], dataB[0], inv, cout[0], inv, Signal, set, temp[0]);
BitAlu	BitAlu2 (dataA[1], dataB[1], cout[0], cout[1], inv, Signal, 1'b0, temp[1]);
BitAlu	BitAlu3 (dataA[2], dataB[2], cout[1], cout[2], inv, Signal, 1'b0, temp[2]);
BitAlu	BitAlu4 (dataA[3], dataB[3], cout[2], cout[3], inv, Signal, 1'b0, temp[3]);
BitAlu	BitAlu5 (dataA[4], dataB[4], cout[3], cout[4], inv, Signal, 1'b0, temp[4]);
BitAlu	BitAlu6 (dataA[5], dataB[5], cout[4], cout[5], inv, Signal, 1'b0, temp[5]);
BitAlu	BitAlu7 (dataA[6], dataB[6], cout[5], cout[6], inv, Signal, 1'b0, temp[6]);
BitAlu	BitAlu8 (dataA[7], dataB[7], cout[6], cout[7], inv, Signal, 1'b0, temp[7]);
BitAlu	BitAlu9 (dataA[8], dataB[8], cout[7], cout[8], inv, Signal, 1'b0, temp[8]);
BitAlu	BitAlu10 (dataA[9], dataB[9], cout[8], cout[9], inv, Signal, 1'b0, temp[9]);
BitAlu	BitAlu11 (dataA[10], dataB[10], cout[9], cout[10], inv, Signal, 1'b0, temp[10]);
BitAlu	BitAlu12 (dataA[11], dataB[11], cout[10], cout[11], inv, Signal, 1'b0, temp[11]);
BitAlu	BitAlu13 (dataA[12], dataB[12], cout[11], cout[12], inv, Signal, 1'b0, temp[12]);
BitAlu	BitAlu14 (dataA[13], dataB[13], cout[12], cout[13], inv, Signal, 1'b0, temp[13]);
BitAlu	BitAlu15 (dataA[14], dataB[14], cout[13], cout[14], inv, Signal, 1'b0, temp[14]);
BitAlu	BitAlu16 (dataA[15], dataB[15], cout[14], cout[15], inv, Signal, 1'b0, temp[15]);
BitAlu	BitAlu17 (dataA[16], dataB[16], cout[15], cout[16], inv, Signal, 1'b0, temp[16]);
BitAlu	BitAlu18 (dataA[17], dataB[17], cout[16], cout[17], inv, Signal, 1'b0, temp[17]);
BitAlu	BitAlu19 (dataA[18], dataB[18], cout[17], cout[18], inv, Signal, 1'b0, temp[18]);
BitAlu	BitAlu20 (dataA[19], dataB[19], cout[18], cout[19], inv, Signal, 1'b0, temp[19]);
BitAlu	BitAlu21 (dataA[20], dataB[20], cout[19], cout[20], inv, Signal, 1'b0, temp[20]);
BitAlu	BitAlu22 (dataA[21], dataB[21], cout[20], cout[21], inv, Signal, 1'b0, temp[21]);
BitAlu	BitAlu23 (dataA[22], dataB[22], cout[21], cout[22], inv, Signal, 1'b0, temp[22]);
BitAlu	BitAlu24 (dataA[23], dataB[23], cout[22], cout[23], inv, Signal, 1'b0, temp[23]);
BitAlu	BitAlu25 (dataA[24], dataB[24], cout[23], cout[24], inv, Signal, 1'b0, temp[24]);
BitAlu	BitAlu26 (dataA[25], dataB[25], cout[24], cout[25], inv, Signal, 1'b0, temp[25]);
BitAlu	BitAlu27 (dataA[26], dataB[26], cout[25], cout[26], inv, Signal, 1'b0, temp[26]);
BitAlu	BitAlu28 (dataA[27], dataB[27], cout[26], cout[27], inv, Signal, 1'b0, temp[27]);
BitAlu	BitAlu29 (dataA[28], dataB[28], cout[27], cout[28], inv, Signal, 1'b0, temp[28]);
BitAlu	BitAlu30 (dataA[29], dataB[29], cout[28], cout[29], inv, Signal, 1'b0, temp[29]);
BitAlu	BitAlu31 (dataA[30], dataB[30], cout[29], cout[30], inv, Signal, 1'b0, temp[30]);
BitAlu	BitAlu32 (dataA[31], dataB[31], cout[30], cout[31], inv, Signal, 1'b0, temp[31],set);




endmodule