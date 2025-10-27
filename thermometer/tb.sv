// Code your testbench here
// or browse Examples

module tb();
  
  parameter DATA_WIDTH=8;
  logic [DATA_WIDTH-1:0] codeIn;
  logic isThermometer;
  
  therm dut (.*);
  
  initial begin
    codeIn = 8'b0000_1111;
    #1 $display($sformatf("isTherm = %b", isThermometer));
    #4;
    
    codeIn = 8'b1111_1111;
    #1 $display($sformatf("isTherm = %b", isThermometer));
    #4;
    
    codeIn = 8'b1010_1010;
    #1 $display($sformatf("isTherm = %b", isThermometer));
    #4;
    
        codeIn = 8'b0000_0000;
    #1 $display($sformatf("isTherm = %b", isThermometer));
    #4;
    
    codeIn = 8'b1111_1110;
    #1 $display($sformatf("isTherm = %b", isThermometer));
    #4;
    
    codeIn = 8'b0111_1111;
    #1 $display($sformatf("isTherm = %b", isThermometer));
    #4;
    $finish;
    
  end
endmodule
