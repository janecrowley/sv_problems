// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples

module tb();
  
  logic clk, resetn, cen, din, doutx, douty;
  
  mm dut (.*);
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    
    resetn = 0;
    @(negedge clk) resetn = 1;
    
    cen = 1;
    
    din = 0;
    @(negedge clk) din = 0; // x high
    @(negedge clk) din = 0; // x and y high
    @(negedge clk) din = 0;
    @(negedge clk) din = 1;
    @(negedge clk) din = 1; // x high
    @(negedge clk) din = 1; // x and y high
    @(negedge clk) din = 0;
    @(negedge clk) din = 1;
    @(negedge clk) din = 1; // x high
    @(negedge clk) din = 0;
    
    @(negedge clk) $finish;
  end
  
endmodule
