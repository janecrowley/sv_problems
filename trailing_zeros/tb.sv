// Code your testbench here
// or browse Examples

module tb();
   
  parameter DATA_WIDTH=8;
  logic [DATA_WIDTH-1:0] din;
  logic [$clog2(DATA_WIDTH):0] dout;
  
  tzeros #(.DATA_WIDTH(DATA_WIDTH)) dut (.*);
  
  initial begin
    $dumpfile("dump.vcd"); 
  	$dumpvars(0,tb);
    
    din = 8'b1000_0000;
    #10 din = 8'b1000_1000;
    #10 din = 8'b1111_1111;
    #10 din = 8'b0000_0000;
    #10 $finish; 
  end
  
endmodule 
  
