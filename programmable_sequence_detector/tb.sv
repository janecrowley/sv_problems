// Code your testbench here
// or browse Examples

module tb();
  logic clk, resetn, din, seen;
  logic [0:4] init;
  
  psd detector (.*);
  
  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    
    repeat(5) begin
      @(posedge clk);
    end

    resetn = 0;
    init = 5'b11011;
    @(negedge clk) resetn = 1;
    
    din = 1;
    
    @(negedge clk);
    @(negedge clk);
    din = 0;
    
    @(negedge clk);
    din = 1;
    
    @(negedge clk);
    
    @(posedge clk);
    $display($sformatf("seen = %b", seen));
    
    @(negedge clk);
    @(negedge clk);
    
    @(negedge clk);
    din = 0;
    
    @(negedge clk);
    din = 1;
    
    @(negedge clk);
    @(negedge clk);
    
    @(negedge clk);
    
    $finish;
    
  end
  
  
endmodule
