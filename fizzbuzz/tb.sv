// Code your testbench here
// or browse Examples

module tb();
  
  logic clk, resetn, fizz, buzz, fizzbuzz;
  
  fizzbuzz fb (.*);
  
  int count;
  
  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);

    count = 0;
    resetn = 0;
    $display("assert resetn");
    @(posedge clk);
    @(posedge clk) resetn = 1;
    $display("deassert resetn");
    
    repeat(8) begin
      $display($sformatf("counter = %d: fizz = %d, buzz = %d, fizzbuzz = %d", count, fizz, buzz, fizzbuzz));
      count++;
      @(posedge clk);
    end
    
    $finish;
    
  end
  
  
endmodule
