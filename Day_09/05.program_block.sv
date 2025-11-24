// Code your design here
// without program block can occur race condition
module pro_example(output bit[3:0]out);
  
  initial begin
    out<=2;
  end
endmodule 

module tb;
  wire [3:0]out;
  
  pro_example dut(out);
  
  initial begin
    if(out==2)
      $display("design assign value is 2");
    else 
      $display("design assign value is %0d",out);
  end
endmodule 
  module dut_example (output bit [3:0] out);
  initial begin
    out <= 2;
  end
endmodule


// Code your design here
//with program block no race condition 
module pro_example(output bit[3:0]out);
  
  initial begin
    out<=2;
  end
endmodule 

// Code your testbench here
// or browse Examples
program top_pro(input bit[3:0]out);
  initial begin
    if(out==2)
      $display("design assign value is 2");
  else 
    $display("design assign value is %0d",out);
  end
endprogram

module tb;
  wire [3:0]out;
  pro_example dut1(out);
  top_pro dut(out);

endmodule
