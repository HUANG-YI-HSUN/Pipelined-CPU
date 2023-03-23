
module Division_Hardware( clk, dataA, dataB, Signal, dataOut, reset ) ;
  
  input clk, reset ;
  input [5:0] Signal ;
  input [31:0] dataA, dataB ;
  output [63:0] dataOut ;
  reg[31:0] q ; //quotent
  reg[31:0] qTemp = 32'd0 ;
  reg [63:0] remainder = 64'd0 ;
  reg [63:0] temp = 64'd0 ;
  reg [63:0] temp1 = 64'd0 ;
  reg rst  = 1'b0 ; 
  parameter DIVU = 6'b011011;
  parameter OUT = 6'b111111;
  
  //wire[63:0] RR, TT ;
  //assign RR[31:0] = dataA ;
  //assign TT[63:32] = dataB ;



always@( posedge clk)
begin
        if ( reset )
        begin
                temp = 64'b0 ;
		remainder = 64'd0 ;
		temp1 = 64'd0 ;
		rst = 1'b0 ;
        end

        else
        begin      	
        case (Signal)
        DIVU:
        begin
		
		if( rst == 1'b0 )
		begin

		remainder = 64'd0 ;
		temp1 = 64'd0 ;
        remainder[31:0] = dataA ;
		temp1[63:32] = dataB ; 
		rst = 1'b1 ;
		end
		
		remainder = remainder - temp1 ;
		
                if ( remainder[63:63] == 1 ) 
                begin
  			remainder = remainder + temp1 ;
			q = q << 1 ;                    
                end

                else        	
                begin
			
			q = q << 1 ; 
			q[0:0] = 1'b1 ; 
	 
		end    
		temp1 = temp1 >> 1 ; 
	//temp[63:32] = q ;
	//temp[31:0] = remainder[31:0] ;
	
	end
        OUT:
	begin
		temp[63:32] = remainder[31:0];
		temp[31:0] = q;
		rst = 1'b0 ;
	end
	endcase
	end

end
assign dataOut = temp ;
endmodule

   
  
