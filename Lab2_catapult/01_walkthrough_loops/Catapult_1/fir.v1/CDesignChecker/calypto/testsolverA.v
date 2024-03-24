module Mod_5 ( P_0 , P_1 , P_2) ;
input wire  [1:4]  P_2 ;
output wire [0:0]  P_0 ;
output wire [0:0]  P_1 ;
assign P_0 = 1'h0;
wire x = (P_2 == 4'h3);
assign P_1 = x;
endmodule
