module mux_2x1(inf.m1 mux);
  assign mux.y=mux.sel?mux.a[1]:mux.a[0];
endmodule


module driver(inf.m2 drv);
  initial begin
    for(int i=0;i<2;i++)begin
      drv.sel=i;
      {drv.a[0],drv.a[1]}=i;
      #10;
    end
  end
    endmodule

module monitor(inf.m3 moni);
always@(moni.sel or moni.a or moni.y)begin
    $display("Time=%0t sel=%0b a[0]=%b a[1]=%b y=%b",$time,moni.sel,moni.a[0],moni.a[1],moni.y);
  end
endmodule


interface inf;
  logic sel;
  logic [1:0]a;
  logic y;
  
  modport m1(input sel,a,output y);
  modport m2(output sel,a,output y);
  modport m3(input sel,a,y);
  
endinterface

module tb;
  inf t();
  
  mux_2x1 dut(t.m1);
  driver dut1(t.m2);
  monitor dut2(t.m3);
  
  initial begin
#50    
    $finish;
  end
endmodule
