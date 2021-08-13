
module adder_12bit(clk, CE, A,B, Cin, S,Cout);
input clk;
input CE;
input [11:0] A,B;
input Cin;
output [11:0] S;
output Cout;

//wire [3:0] p,g,c;
reg [11:0] p,g,c;
reg [11:0] S;
reg Cout;

always @(posedge clk) begin
        if (CE == 1'b1) begin
          p = A ^ B;
          g = A & B;
          c[0] = Cin;
          c[1] = g[0]|(p[0]&c[0]);
          c[2] = g[1] | (p[1]&g[0]) | p[1]&p[0]&c[0];
          c[3] = g[2] | (p[2]&g[1]) | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&c[0];
          c[4] = g[3] | (p[3] & c[3]);
          c[5] = g[4] | (p[4] & c[4]);
          c[6] = g[5] | (p[5] & c[5]);
          c[7] = g[6] | (p[6] & c[6]);
          c[8] = g[7] | (p[7] & c[7]);
          c[9] = g[8] | (p[8] & c[8]);
          c[10] = g[9] | (p[9] & c[9]);
          c[11] = g[10] | (p[10] & c[10]);
          Cout = g[11] | (p[11] & c[11]);
          S = p^c;
        end
end
endmodule
