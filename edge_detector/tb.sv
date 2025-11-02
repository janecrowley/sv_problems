// Code your testbench here
// or browse Examples

module tb();
  logic clk, resetn, din, dout;
  
  edge_detector ed (.*);
  
  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end
  
  initial begin
    
    $dumpfile("dump.vcd"); 				
    $dumpvars(0, tb);
    
    resetn = 0;
    din = 0;
    @(posedge clk);
    @(posedge clk) resetn = 1;
    
    repeat (2) @(posedge clk);
    @(posedge clk) din = 1;
    
    @(posedge clk) din = 0;
    @(posedge clk);
    @(posedge clk); din = 1;
    
    repeat (2) @(posedge clk);
    
    $finish;
  end
  
endmodule
