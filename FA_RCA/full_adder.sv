// Code your design here

module full_adder (
  input a, b, cin,
  output sum, cout
);
  
  assign sum = a ^ b ^ cin;
  assign cout = cin && (a ^ b) || (a&&b);
  
endmodule
