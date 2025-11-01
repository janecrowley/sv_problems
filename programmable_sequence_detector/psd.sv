// Code your design here

module psd (
  input clk,
  input resetn,
  input [0:4] init,
  input din,
  output logic seen
);
  
  logic [4:0] curr, len, target;
  logic reset_seen;
  
  always @(posedge clk) begin
    if (!resetn) begin
      reset_seen <= 1;
      curr <= 0;
      len <= 0;
    end else begin
      curr <= {curr[3:0], din};
      len <= (len < 5) ? len + 1 : len;
    end
  end
  
  assign target = (resetn && reset_seen && len == 0) ? init : target;
  assign seen = reset_seen && (curr == target) && (len == 5);
   
endmodule
