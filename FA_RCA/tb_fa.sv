// Code your testbench here
// or browse Examples

module tb();
  
  logic a, b, cin, sum, cout;
  
  full_adder dut(.*);
  
  initial begin
    a = 0; b = 0; cin = 0;
    #1;
    $display($sformatf("sum = %d, cout = %d", sum, cout));
    #10;
    
    a = 0; b = 0; cin = 1;
    #1;
    $display($sformatf("sum = %d, cout = %d", sum, cout));
    #10;
    
    a = 0; b = 1; cin = 0; 
    #1;
    $display($sformatf("sum = %d, cout = %d", sum, cout));
    #10;
    
    a = 0; b = 1; cin = 1;
    #1;
    $display($sformatf("sum = %d, cout = %d", sum, cout));
    #10;
    
    a = 1; b = 0; cin = 0;
    #1;
    $display($sformatf("sum = %d, cout = %d", sum, cout));
    #10;
    
    a = 1; b = 0; cin = 1;
    #1;
    $display($sformatf("sum = %d, cout = %d", sum, cout));
    #10;
    
    a = 1; b = 1; cin = 0;
    #1;
    $display($sformatf("sum = %d, cout = %d", sum, cout));
    #10;
    
    a = 1; b = 1; cin = 1;
    #1;
    $display($sformatf("sum = %d, cout = %d", sum, cout));
    #10;
    
  end
  
endmodule
