// Code your design here

module mm (
  input clk, resetn, cen, din,
  output doutx, douty  
);
  
  typedef enum logic [2:0] {
    S0, S1, S2, S3, S4
  } state_t;
  
  state_t curr_state, next_state;
  
  logic din_ff, cen_ff;
  
  always_ff @(posedge clk) begin
    if (!resetn) begin
      curr_state <= S0;
      din_ff <= 1'b0;
      cen_ff <= 1'b0;
    end else begin
      curr_state <= next_state;
      din_ff <= din;
      cen_ff <= cen;
    end
  end
  
  always_comb begin
    case (curr_state)
      S0: next_state = din ? S3 : S1;
      S1: next_state = din ? S3 : S2;
      S2: next_state = din ? S3 : S2;
      S3: next_state = din ? S4 : S1;
      S4: next_state = din ? S4 : S1;    
    endcase
  end
  
  assign doutx = cen_ff && (((curr_state == S1 || curr_state == S2) && ~din_ff)
                            || ((curr_state == S3 || curr_state == S4) && din_ff));
  
  assign douty = cen_ff && ((curr_state == S2 && ~din_ff) || (curr_state == S4 && din_ff));
endmodule
