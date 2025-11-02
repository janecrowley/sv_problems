// Code your design here

module edge_detector (
  input clk,
  input resetn,
  input din,
  output logic dout
);
  
  typedef enum {STAY_ZERO, RISING, STAY_ONE, FALLING} state_t;
  state_t curr, next;
  
  always_ff @(posedge clk) begin
    if (!resetn) begin
      curr <= STAY_ZERO;
    end else begin
      curr <= next;
    end
  end
  
  always_comb begin
    case (curr)
      STAY_ZERO: next = din ? RISING : STAY_ZERO;
      RISING: next = din ? STAY_ONE : FALLING;
      STAY_ONE: next = din ? STAY_ONE : FALLING;
      FALLING: next = din ? RISING : STAY_ZERO;
    endcase
  end
  
  assign dout = (curr == RISING);
      

endmodule
