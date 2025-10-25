`include "design.sv"
module rca #(parameter
  DATA_WIDTH=8          
)(
  input [DATA_WIDTH-1:0] a,
  input [DATA_WIDTH-1:0] b,

  output logic [DATA_WIDTH:0] sum,
  output logic [DATA_WIDTH-1:0] count_fa1
);
  
  genvar i; 
  generate 
    
    for (i=0; i < DATA_WIDTH; i++) begin
    
      if (i == 0) begin
        full_adder f(
          .a(a[i]),
          .b(b[i]),
          .cin(1'b0),
          .sum(sum[i]),
          .cout(count_fa1[i])
        );
      end else begin
        full_adder f(
          .a(a[i]),
          .b(b[i]),
          .cin(count_fa1[i-1]),
          .sum(sum[i]),
          .cout(count_fa1[i])
        );
      end
    end
    
  endgenerate
  
  assign sum[DATA_WIDTH] = count_fa1[DATA_WIDTH-1];
  
  
endmodule
