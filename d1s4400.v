module d1s4400 (a,b,c,d);

input wire a, b, c;
output wire d;

wire e, f;

and E1(e, a, b);
not E2(f, c);
and E3(d, e, f);

endmodule
