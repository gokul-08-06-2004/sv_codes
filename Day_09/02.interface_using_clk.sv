// Code your design here
module mux_2x1(inf mux);
  
  assign mux.y=mux.sel?mux.a[1]:mux.a[0];
  
endmodule
// Code your testbench here
// or browse Examples
interface inf(input logic clk);
  logic [1:0]a;
  logic sel;
  logic y;
endinterface

module tb;
  
  logic clk;
  inf mux(clk);
  
  mux_2x1 m1(mux);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("Time=%0t sel=%b a[0]=%b a[1]=%b y=%b",$time,mux.sel,mux.a[0],mux.a[1],mux.y);
  mux.sel=0;
    for(int i=0;i<2;i++)begin
      {mux.a[0],mux.a[1]}=i[1:0];
      #10;
    end
      mux.sel=1;
    for(int i=2;i<4;i++)begin
      {mux.a[0],mux.a[1]}=i[1:0];
    #10;
    end
    $finish;
  end
endmodule
