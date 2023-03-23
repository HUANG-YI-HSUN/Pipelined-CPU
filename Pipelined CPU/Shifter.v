
module My_Shifter( dataA, dataB, Signal, dataOut, reset );
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;

output [31:0] dataOut ;
wire [4:0] shiftNum ;

wire [31:0] temp, temp1, temp2, temp3, temp4 , dataOut  ;

//parameter SRL = 6'b000010;

assign shiftNum = dataB[4:0] ;

ShifterMUX s1(.a(dataA[1]), .b(dataA[0]), .sel(shiftNum[0]), .out(temp[0]) );
ShifterMUX s2(.a(dataA[2]), .b(dataA[1]), .sel(shiftNum[0]), .out(temp[1]) );
ShifterMUX s3(.a(dataA[3]), .b(dataA[2]), .sel(shiftNum[0]), .out(temp[2]) );
ShifterMUX s4(.a(dataA[4]), .b(dataA[3]), .sel(shiftNum[0]), .out(temp[3]) );
ShifterMUX s5(.a(dataA[5]), .b(dataA[4]), .sel(shiftNum[0]), .out(temp[4]) );
ShifterMUX s6(.a(dataA[6]), .b(dataA[5]), .sel(shiftNum[0]), .out(temp[5]) );
ShifterMUX s7(.a(dataA[7]), .b(dataA[6]), .sel(shiftNum[0]), .out(temp[6]) );
ShifterMUX s8(.a(dataA[8]), .b(dataA[7]), .sel(shiftNum[0]), .out(temp[7]) );
ShifterMUX s9(.a(dataA[9]), .b(dataA[8]), .sel(shiftNum[0]), .out(temp[8]) );
ShifterMUX s10(.a(dataA[10]), .b(dataA[9]), .sel(shiftNum[0]), .out(temp[9]) );
ShifterMUX s11(.a(dataA[11]), .b(dataA[10]), .sel(shiftNum[0]), .out(temp[10]) );
ShifterMUX s12(.a(dataA[12]), .b(dataA[11]), .sel(shiftNum[0]), .out(temp[11]) );
ShifterMUX s13(.a(dataA[13]), .b(dataA[12]), .sel(shiftNum[0]), .out(temp[12]) );
ShifterMUX s14(.a(dataA[14]), .b(dataA[13]), .sel(shiftNum[0]), .out(temp[13]) );
ShifterMUX s15(.a(dataA[15]), .b(dataA[14]), .sel(shiftNum[0]), .out(temp[14]) );
ShifterMUX s16(.a(dataA[16]), .b(dataA[15]), .sel(shiftNum[0]), .out(temp[15]) );
ShifterMUX s17(.a(dataA[17]), .b(dataA[16]), .sel(shiftNum[0]), .out(temp[16]) );
ShifterMUX s18(.a(dataA[18]), .b(dataA[17]), .sel(shiftNum[0]), .out(temp[17]) );
ShifterMUX s19(.a(dataA[19]), .b(dataA[18]), .sel(shiftNum[0]), .out(temp[18]) );
ShifterMUX s20(.a(dataA[20]), .b(dataA[19]), .sel(shiftNum[0]), .out(temp[19]) );
ShifterMUX s21(.a(dataA[21]), .b(dataA[20]), .sel(shiftNum[0]), .out(temp[20]) );
ShifterMUX s22(.a(dataA[22]), .b(dataA[21]), .sel(shiftNum[0]), .out(temp[21]) );
ShifterMUX s23(.a(dataA[23]), .b(dataA[22]), .sel(shiftNum[0]), .out(temp[22]) );
ShifterMUX s24(.a(dataA[24]), .b(dataA[23]), .sel(shiftNum[0]), .out(temp[23]) );
ShifterMUX s25(.a(dataA[25]), .b(dataA[24]), .sel(shiftNum[0]), .out(temp[24]) );
ShifterMUX s26(.a(dataA[26]), .b(dataA[25]), .sel(shiftNum[0]), .out(temp[25]) );
ShifterMUX s27(.a(dataA[27]), .b(dataA[26]), .sel(shiftNum[0]), .out(temp[26]) );
ShifterMUX s28(.a(dataA[28]), .b(dataA[27]), .sel(shiftNum[0]), .out(temp[27]) );
ShifterMUX s29(.a(dataA[29]), .b(dataA[28]), .sel(shiftNum[0]), .out(temp[28]) );
ShifterMUX s30(.a(dataA[30]), .b(dataA[29]), .sel(shiftNum[0]), .out(temp[29]) );
ShifterMUX s31(.a(dataA[31]), .b(dataA[30]), .sel(shiftNum[0]), .out(temp[30]) );
ShifterMUX s32(.a(1'd0), .b(1'd0), .sel(shiftNum[0]), .out(temp[31]) );
//Above are shiftNum[0]

ShifterMUX o1(.a(temp[2]), .b(temp[0]), .sel(shiftNum[1]), .out(temp1[0]) );
ShifterMUX o2(.a(temp[3]), .b(temp[1]), .sel(shiftNum[1]), .out(temp1[1]) );
ShifterMUX o3(.a(temp[4]), .b(temp[2]), .sel(shiftNum[1]), .out(temp1[2]) );
ShifterMUX o4(.a(temp[5]), .b(temp[3]), .sel(shiftNum[1]), .out(temp1[3]) );
ShifterMUX o5(.a(temp[6]), .b(temp[4]), .sel(shiftNum[1]), .out(temp1[4]) );
ShifterMUX o6(.a(temp[7]), .b(temp[5]), .sel(shiftNum[1]), .out(temp1[5]) );
ShifterMUX o7(.a(temp[8]), .b(temp[6]), .sel(shiftNum[1]), .out(temp1[6]) );
ShifterMUX o8(.a(temp[9]), .b(temp[7]), .sel(shiftNum[1]), .out(temp1[7]) );
ShifterMUX o9(.a(temp[10]), .b(temp[8]), .sel(shiftNum[1]), .out(temp1[8]) );
ShifterMUX o10(.a(temp[11]), .b(temp[9]), .sel(shiftNum[1]), .out(temp1[9]) );
ShifterMUX o11(.a(temp[12]), .b(temp[10]), .sel(shiftNum[1]), .out(temp1[10]) );
ShifterMUX o12(.a(temp[13]), .b(temp[11]), .sel(shiftNum[1]), .out(temp1[11]) );
ShifterMUX o13(.a(temp[14]), .b(temp[12]), .sel(shiftNum[1]), .out(temp1[12]) );
ShifterMUX o14(.a(temp[15]), .b(temp[13]), .sel(shiftNum[1]), .out(temp1[13]) );
ShifterMUX o15(.a(temp[16]), .b(temp[14]), .sel(shiftNum[1]), .out(temp1[14]) );
ShifterMUX o16(.a(temp[17]), .b(temp[15]), .sel(shiftNum[1]), .out(temp1[15]) );
ShifterMUX o17(.a(temp[18]), .b(temp[16]), .sel(shiftNum[1]), .out(temp1[16]) );
ShifterMUX o18(.a(temp[19]), .b(temp[17]), .sel(shiftNum[1]), .out(temp1[17]) );
ShifterMUX o19(.a(temp[20]), .b(temp[18]), .sel(shiftNum[1]), .out(temp1[18]) );
ShifterMUX o20(.a(temp[21]), .b(temp[19]), .sel(shiftNum[1]), .out(temp1[19]) );
ShifterMUX o21(.a(temp[22]), .b(temp[20]), .sel(shiftNum[1]), .out(temp1[20]) );
ShifterMUX o22(.a(temp[23]), .b(temp[21]), .sel(shiftNum[1]), .out(temp1[21]) );
ShifterMUX o23(.a(temp[24]), .b(temp[22]), .sel(shiftNum[1]), .out(temp1[22]) );
ShifterMUX o24(.a(temp[25]), .b(temp[23]), .sel(shiftNum[1]), .out(temp1[23]) );
ShifterMUX o25(.a(temp[26]), .b(temp[24]), .sel(shiftNum[1]), .out(temp1[24]) );
ShifterMUX o26(.a(temp[27]), .b(temp[25]), .sel(shiftNum[1]), .out(temp1[25]) );
ShifterMUX o27(.a(temp[28]), .b(temp[26]), .sel(shiftNum[1]), .out(temp1[26]) );
ShifterMUX o28(.a(temp[29]), .b(temp[27]), .sel(shiftNum[1]), .out(temp1[27]) );
ShifterMUX o29(.a(temp[30]), .b(temp[28]), .sel(shiftNum[1]), .out(temp1[28]) );
ShifterMUX o30(.a(temp[31]), .b(temp[29]), .sel(shiftNum[1]), .out(temp1[29]) );
ShifterMUX o31(.a(1'd0), .b(1'd0), .sel(shiftNum[1]), .out(temp1[30]) );
ShifterMUX o32(.a(1'd0), .b(1'd0), .sel(shiftNum[1]), .out(temp1[31]) );
//Above are shiftNum[1]

ShifterMUX two1(.a(temp1[4]), .b(temp1[0]), .sel(shiftNum[2]), .out(temp2[0]) );
ShifterMUX two2(.a(temp1[5]), .b(temp1[1]), .sel(shiftNum[2]), .out(temp2[1]) );
ShifterMUX two3(.a(temp1[6]), .b(temp1[2]), .sel(shiftNum[2]), .out(temp2[2]) );
ShifterMUX two4(.a(temp1[7]), .b(temp1[3]), .sel(shiftNum[2]), .out(temp2[3]) );
ShifterMUX two5(.a(temp1[8]), .b(temp1[4]), .sel(shiftNum[2]), .out(temp2[4]) );
ShifterMUX two6(.a(temp1[9]), .b(temp1[5]), .sel(shiftNum[2]), .out(temp2[5]) );
ShifterMUX two7(.a(temp1[10]), .b(temp1[6]), .sel(shiftNum[2]), .out(temp2[6]) );
ShifterMUX two8(.a(temp1[11]), .b(temp1[7]), .sel(shiftNum[2]), .out(temp2[7]) );
ShifterMUX two9(.a(temp1[12]), .b(temp1[8]), .sel(shiftNum[2]), .out(temp2[8]) );
ShifterMUX two10(.a(temp1[13]), .b(temp1[9]), .sel(shiftNum[2]), .out(temp2[9]) );
ShifterMUX two11(.a(temp1[14]), .b(temp1[10]), .sel(shiftNum[2]), .out(temp2[10]) );
ShifterMUX two12(.a(temp1[15]), .b(temp1[11]), .sel(shiftNum[2]), .out(temp2[11]) );
ShifterMUX two13(.a(temp1[16]), .b(temp1[12]), .sel(shiftNum[2]), .out(temp2[12]) );
ShifterMUX two14(.a(temp1[17]), .b(temp1[13]), .sel(shiftNum[2]), .out(temp2[13]) );
ShifterMUX two15(.a(temp1[18]), .b(temp1[14]), .sel(shiftNum[2]), .out(temp2[14]) );
ShifterMUX two16(.a(temp1[19]), .b(temp1[15]), .sel(shiftNum[2]), .out(temp2[15]) );
ShifterMUX two17(.a(temp1[20]), .b(temp1[16]), .sel(shiftNum[2]), .out(temp2[16]) );
ShifterMUX two18(.a(temp1[21]), .b(temp1[17]), .sel(shiftNum[2]), .out(temp2[17]) );
ShifterMUX two19(.a(temp1[22]), .b(temp1[18]), .sel(shiftNum[2]), .out(temp2[18]) );
ShifterMUX two20(.a(temp1[23]), .b(temp1[19]), .sel(shiftNum[2]), .out(temp2[19]) );
ShifterMUX two21(.a(temp1[24]), .b(temp1[20]), .sel(shiftNum[2]), .out(temp2[20]) );
ShifterMUX two22(.a(temp1[25]), .b(temp1[21]), .sel(shiftNum[2]), .out(temp2[21]) );
ShifterMUX two23(.a(temp1[26]), .b(temp1[22]), .sel(shiftNum[2]), .out(temp2[22]) );
ShifterMUX two24(.a(temp1[27]), .b(temp1[23]), .sel(shiftNum[2]), .out(temp2[23]) );
ShifterMUX two25(.a(temp1[28]), .b(temp1[24]), .sel(shiftNum[2]), .out(temp2[24]) );
ShifterMUX two26(.a(temp1[29]), .b(temp1[25]), .sel(shiftNum[2]), .out(temp2[25]) );
ShifterMUX two27(.a(temp1[30]), .b(temp1[26]), .sel(shiftNum[2]), .out(temp2[26]) );
ShifterMUX two28(.a(temp1[31]), .b(temp1[27]), .sel(shiftNum[2]), .out(temp2[27]) );
ShifterMUX two29(.a(1'd0), .b(1'd0), .sel(shiftNum[2]), .out(temp2[28]) );
ShifterMUX two30(.a(1'd0), .b(1'd0), .sel(shiftNum[2]), .out(temp2[29]) );
ShifterMUX two31(.a(1'd0), .b(1'd0), .sel(shiftNum[2]), .out(temp2[30]) );
ShifterMUX two32(.a(1'd0), .b(1'd0), .sel(shiftNum[2]), .out(temp2[31]) );
//Above are shiftNum[2]

ShifterMUX three1(.a(temp2[8]), .b(temp2[0]), .sel(shiftNum[3]), .out(temp3[0]) );
ShifterMUX three2(.a(temp2[9]), .b(temp2[1]), .sel(shiftNum[3]), .out(temp3[1]) );
ShifterMUX three3(.a(temp2[10]), .b(temp2[2]), .sel(shiftNum[3]), .out(temp3[2]) );
ShifterMUX three4(.a(temp2[11]), .b(temp2[3]), .sel(shiftNum[3]), .out(temp3[3]) );
ShifterMUX three5(.a(temp2[12]), .b(temp2[4]), .sel(shiftNum[3]), .out(temp3[4]) );
ShifterMUX three6(.a(temp2[13]), .b(temp2[5]), .sel(shiftNum[3]), .out(temp3[5]) );
ShifterMUX three7(.a(temp2[14]), .b(temp2[6]), .sel(shiftNum[3]), .out(temp3[6]) );
ShifterMUX three8(.a(temp2[15]), .b(temp2[7]), .sel(shiftNum[3]), .out(temp3[7]) );
ShifterMUX three9(.a(temp2[16]), .b(temp2[8]), .sel(shiftNum[3]), .out(temp3[8]) );
ShifterMUX three10(.a(temp2[17]), .b(temp2[9]), .sel(shiftNum[3]), .out(temp3[9]) );
ShifterMUX three11(.a(temp2[18]), .b(temp2[10]), .sel(shiftNum[3]), .out(temp3[10]) );
ShifterMUX three12(.a(temp2[19]), .b(temp2[11]), .sel(shiftNum[3]), .out(temp3[11]) );
ShifterMUX three13(.a(temp2[20]), .b(temp2[12]), .sel(shiftNum[3]), .out(temp3[12]) );
ShifterMUX three14(.a(temp2[21]), .b(temp2[13]), .sel(shiftNum[3]), .out(temp3[13]) );
ShifterMUX three15(.a(temp2[22]), .b(temp2[14]), .sel(shiftNum[3]), .out(temp3[14]) );
ShifterMUX three16(.a(temp2[23]), .b(temp2[15]), .sel(shiftNum[3]), .out(temp3[15]) );
ShifterMUX three17(.a(temp2[24]), .b(temp2[16]), .sel(shiftNum[3]), .out(temp3[16]) );
ShifterMUX three18(.a(temp2[25]), .b(temp2[17]), .sel(shiftNum[3]), .out(temp3[17]) );
ShifterMUX three19(.a(temp2[26]), .b(temp2[18]), .sel(shiftNum[3]), .out(temp3[18]) );
ShifterMUX three20(.a(temp2[27]), .b(temp2[19]), .sel(shiftNum[3]), .out(temp3[19]) );
ShifterMUX three21(.a(temp2[28]), .b(temp2[20]), .sel(shiftNum[3]), .out(temp3[20]) );
ShifterMUX three22(.a(temp2[29]), .b(temp2[21]), .sel(shiftNum[3]), .out(temp3[21]) );
ShifterMUX three23(.a(temp2[30]), .b(temp2[22]), .sel(shiftNum[3]), .out(temp3[22]) );
ShifterMUX three24(.a(temp2[31]), .b(temp2[23]), .sel(shiftNum[3]), .out(temp3[23]) );
ShifterMUX three25(.a(1'd0), .b(1'd0), .sel(shiftNum[3]), .out(temp3[24]) );
ShifterMUX three26(.a(1'd0), .b(1'd0), .sel(shiftNum[3]), .out(temp3[25]) );
ShifterMUX three27(.a(1'd0), .b(1'd0), .sel(shiftNum[3]), .out(temp3[26]) );
ShifterMUX three28(.a(1'd0), .b(1'd0), .sel(shiftNum[3]), .out(temp3[27]) );
ShifterMUX three29(.a(1'd0), .b(1'd0), .sel(shiftNum[3]), .out(temp3[28]) );
ShifterMUX three30(.a(1'd0), .b(1'd0), .sel(shiftNum[3]), .out(temp3[29]) );
ShifterMUX three31(.a(1'd0), .b(1'd0), .sel(shiftNum[3]), .out(temp3[30]) );
ShifterMUX three32(.a(1'd0), .b(1'd0), .sel(shiftNum[3]), .out(temp3[31]) );
//Above are shiftNum[3]

ShifterMUX four1(.a(temp3[16]), .b(temp3[0]), .sel(shiftNum[4]), .out(temp4[0]) );
ShifterMUX four2(.a(temp3[17]), .b(temp3[1]), .sel(shiftNum[4]), .out(temp4[1]) );
ShifterMUX four3(.a(temp3[18]), .b(temp3[2]), .sel(shiftNum[4]), .out(temp4[2]) );
ShifterMUX four4(.a(temp3[19]), .b(temp3[3]), .sel(shiftNum[4]), .out(temp4[3]) );
ShifterMUX four5(.a(temp3[20]), .b(temp3[4]), .sel(shiftNum[4]), .out(temp4[4]) );
ShifterMUX four6(.a(temp3[21]), .b(temp3[5]), .sel(shiftNum[4]), .out(temp4[5]) );
ShifterMUX four7(.a(temp3[22]), .b(temp3[6]), .sel(shiftNum[4]), .out(temp4[6]) );
ShifterMUX four8(.a(temp3[23]), .b(temp3[7]), .sel(shiftNum[4]), .out(temp4[7]) );
ShifterMUX four9(.a(temp3[24]), .b(temp3[8]), .sel(shiftNum[4]), .out(temp4[8]) );
ShifterMUX four10(.a(temp3[25]), .b(temp3[9]), .sel(shiftNum[4]), .out(temp4[9]) );
ShifterMUX four11(.a(temp3[26]), .b(temp3[10]), .sel(shiftNum[4]), .out(temp4[10]) );
ShifterMUX four12(.a(temp3[27]), .b(temp3[11]), .sel(shiftNum[4]), .out(temp4[11]) );
ShifterMUX four13(.a(temp3[28]), .b(temp3[12]), .sel(shiftNum[4]), .out(temp4[12]) );
ShifterMUX four14(.a(temp3[29]), .b(temp3[13]), .sel(shiftNum[4]), .out(temp4[13]) );
ShifterMUX four15(.a(temp3[30]), .b(temp3[14]), .sel(shiftNum[4]), .out(temp4[14]) );
ShifterMUX four16(.a(temp3[31]), .b(temp3[15]), .sel(shiftNum[4]), .out(temp4[15]) );
ShifterMUX four17(.a(1'd0), .b(1'd0), .sel(shiftNum[4]), .out(temp4[16]) );
ShifterMUX four18(.a(1'd0), .b(1'd0), .sel(shiftNum[4]), .out(temp4[17]) );
ShifterMUX four19(.a(1'd0), .b(1'd0), .sel(shiftNum[4]), .out(temp4[18]) );
ShifterMUX four20(.a(1'd0), .b(1'd0), .sel(shiftNum[4]), .out(temp4[19]) );
ShifterMUX four21(.a(1'd0), .b(1'd0), .sel(shiftNum[4]), .out(temp4[20]) );
ShifterMUX four22(.a(1'd0), .b(1'd0), .sel(shiftNum[4]), .out(temp4[21]) );
ShifterMUX four23(.a(1'd0), .b(1'd0), .sel(shiftNum[4]), .out(temp4[22]) );
ShifterMUX four24(.a(1'd0), .b(1'd0), .sel(shiftNum[4]), .out(temp4[23]) );
ShifterMUX four25(.a(1'd0), .b(1'd0), .sel(shiftNum[4]), .out(temp4[24]) );
ShifterMUX four26(.a(1'd0), .b(1'd0), .sel(shiftNum[4]), .out(temp4[25]) );
ShifterMUX four27(.a(1'd0), .b(1'd0), .sel(shiftNum[4]), .out(temp4[26]) );
ShifterMUX four28(.a(1'd0), .b(1'd0), .sel(shiftNum[4]), .out(temp4[27]) );
ShifterMUX four29(.a(1'd0), .b(1'd0), .sel(shiftNum[4]), .out(temp4[28]) );
ShifterMUX four30(.a(1'd0), .b(1'd0), .sel(shiftNum[4]), .out(temp4[29]) );
ShifterMUX four31(.a(1'd0), .b(1'd0), .sel(shiftNum[4]), .out(temp4[30]) );
ShifterMUX four32(.a(1'd0), .b(1'd0), .sel(shiftNum[4]), .out(temp4[31]) );
//Above are shiftNum[4]


assign dataOut = ((Signal == 6'd2 ) && (reset != 1 )) ? temp4 : 32'd0  ;


endmodule
		
		





































































