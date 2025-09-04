module sg_tb;
  
  logic clk, reset;
  logic [31:0] seq_o;
  
  logic [31:0] golden_q[$] = {0,1,1,1,2,2,3,4,5,7,9,12,16,21,28,37};
  
  initial begin
    clk = '0;
    forever begin
      #5 clk = ~clk;
    end
  end
  
  seq_generator dut (
    .clk(clk),
    .reset(reset),
    .seq_o(seq_o)
  );
  
  int i;
  
  initial begin
    i = 1;
    reset = 1;
    #12;
    reset = 0;
  end
  
  initial begin
    $dumpfile("dump.vcd");      
    $dumpvars(0, sg_tb);     
  end
  
  
  always @(posedge clk) begin
    if (i >= golden_q.size()) $finish;
    
    if (seq_o != golden_q[i]) begin
      $display("FAIL at cycle %0d: Got %0d, Expected %0d", i, seq_o, golden_q[i]);
    end else begin
      $display("PASS at cycle %0d: %0d", i, seq_o);
    end
    i <= i + 1;
    
  end
  
  
  
  
endmodule
