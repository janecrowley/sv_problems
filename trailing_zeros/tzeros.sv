// Code your design here

module tzeros #(parameter
  DATA_WIDTH=32
) (
  input [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);
  
  logic [$clog2(DATA_WIDTH):0] count;
  int i;
  always_comb begin
    count=0;
    for (int i=0; i<DATA_WIDTH; i++) begin
      if (!din[i]) count++;
      else break;
    end 
  end
  
  assign dout=count;
  
endmodule
