// Code your design here

module fizzbuzz #(parameter
	MAX_CYCLES=8,
    FIZZ=2,              
    BUZZ=3    	
    )(
  input clk,
  input resetn,
  output logic fizz,
  output logic buzz,
  output logic fizzbuzz
);
  
  logic [$clog2(MAX_CYCLES)-1:0] counter;
    
  always_ff @(posedge clk) begin
    if (!resetn) begin
      counter <= '0;
    end if (counter < MAX_CYCLES) begin
      counter <= counter + 1;
    end
  end
  
  assign fizz = (counter % FIZZ) == 0;
  assign buzz = (counter % BUZZ) == 0;
  assign fizzbuzz = fizz && buzz;
  
endmodule
