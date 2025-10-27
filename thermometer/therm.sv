// Code your design here


module therm #(parameter
  DATA_WIDTH=8
) (
  input [DATA_WIDTH-1:0] codeIn,
  output logic isThermometer
);
  
  logic [$clog2(DATA_WIDTH)-1:0] num_transitions;
  int i;
  logic prev;
  
  always_comb begin
    num_transitions = 0;
    for (i = 1; i < DATA_WIDTH; i++) begin
      prev = codeIn[i-1];
      if (codeIn[i] == ~prev) begin
        num_transitions++;
      end
    end
  end
  assign isThermometer = (num_transitions == 'b1); 
  
endmodule
