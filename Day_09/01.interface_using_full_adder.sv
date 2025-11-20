// Code your design here
module half_adder(input logic a,b,output logic s_out,c_out);
  assign s_out=a^b;
  assign c_out=a&b;
endmodule

module full_adder(ad fa);
  logic s0,c1,c2;
  
  half_adder h1(fa.a,fa.b,s0,c1);
  half_adder h2(fa.c,s0,fa.s_out,c2);
  
  assign fa.c_out=c2|c1;
endmodule
// interface
interface ad;
  logic a,b,c;
  logic s_out,c_out;
endinterface
//testbench
module tb;
  ad adder();
  full_adder f1(adder);
  
  initial begin
    $monitor("Time=%0t a=%b b=%b c=%b s_out=%b c_out=%b",$time,adder.a,adder.b,adder.c,adder.s_out,adder.c_out);
    
    for(int i=0;i<8;i++)begin
      {adder.a,adder.b,adder.c}=i;
      #10;
   
    end
    $finish;
  end
endmodule
