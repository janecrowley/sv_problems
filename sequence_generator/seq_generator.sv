module seq_generator (
  input   logic        clk,
  input   logic        reset,

  output  logic [31:0] seq_o
);
  
  logic [31:0] last_three [0:2];

  // Write your logic here...
  always_ff @(posedge clk) begin
    if (reset) begin
      last_three = '{0, 1, 1};
    end else begin
      last_three[2] <= last_three[0] + last_three[1];
      last_three[1] <= last_three[2];
      last_three[0] <= last_three[1];
    end
  end
  
  assign seq_o = last_three[2];

endmodule
