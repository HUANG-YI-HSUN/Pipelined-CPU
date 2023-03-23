
module ShifterMUX( a, b, sel, out );

input a, b, sel ;
output out ;
wire out ;

assign out = sel ? a : b ;

endmodule




