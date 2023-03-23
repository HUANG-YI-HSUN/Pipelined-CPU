
module My_HiLo( clk, DivAns, HiOut, LoOut, reset );
input clk ;
input reset ;
input [63:0] DivAns ;
output [31:0] HiOut ;
output [31:0] LoOut ;

reg [63:0] HiLo ;

always@( posedge clk )
begin
if ( reset )
  begin
    HiLo = 64'b0 ;
  end

  else
  begin
    HiLo = DivAns ;
  end

end

assign HiOut = HiLo[63:32] ;
assign LoOut = HiLo[31:0] ;

endmodule