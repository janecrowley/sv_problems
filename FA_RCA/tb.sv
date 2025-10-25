// Code your testbench here
// or browse Examples

module tb();
  parameter DATA_WIDTH=8;
  logic [DATA_WIDTH-1:0] a, b, count_fa1;
  logic [DATA_WIDTH:0] sum;
  rca #(.DATA_WIDTH(DATA_WIDTH)) dut (
    .*
  );
  
  initial begin
    a = 8'd11; b=8'd22;
    #1 $display($sformatf("sum = %d", sum));
    #10;
                
    a = 8'd100; b=8'd17;
    #1 $display($sformatf("sum = %d", sum));
    #10;
                
    a = 8'd25; b=8'd25;
    #1 $display($sformatf("sum = %d", sum));
    #10;
    
    a = 8'd250; b=8'd50;
    #1 $display($sformatf("sum = %d", sum));
    #10;
           
     $finish;
  end
  
  
endmodule
