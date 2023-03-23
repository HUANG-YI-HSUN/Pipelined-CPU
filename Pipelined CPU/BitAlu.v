
module BitAlu(a, b, cin, cout, inv, sel, slt, out,set);
input a, b, cin, slt,inv;
input [5:0]sel ;
output cout, out ,set ;
wire   e1,e2,b1 ;
    xor (b1, b, inv);
FA U_FA( .a(a), .b(b1), .c(cin), .cout(cout), .sum(s) ) ;
    and (e1, a, b);
    or (e2, a, b);
assign set = s ;
assign out = ( sel == 6'd36 )? e1 : ( sel ==  6'd37 ) ? e2 : ( sel ==  6'd32 ) ? s : ( sel ==  6'd34 ) ? s  : slt ;

endmodule

