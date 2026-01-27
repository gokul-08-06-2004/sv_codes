module m1;
  bit[2:0] a,b;
covergroup cg;
  c1:coverpoint a;
  c2:coverpoint b;
endgroup
cg cs;
  initial begin
    cs=new();//use new() collect the data for design when sample is trigger
    for(int i=0;i<4;i++)begin
      a=$random();
      b=$random();
      cs.sample();//trigger the covergroup
      $display("a=%0d b=%0d coverage=%.2f %%",a,b,cs.get_inst_coverage());
    end
  end
endmodule 

// # a=4 b=1 coverage=12.50 %
// # a=1 b=3 coverage=25.00 %
// # a=5 b=5 coverage=37.50 %
// # a=5 b=2 coverage=43.75 %


covergroup cg(ref bit[2:0]a,b);
  c1:coverpoint a;
  c2:coverpoint b;
endgroup

module m1;
  bit[2:0]a,b;
cg cs;
  initial begin
    cs=new(a,b);
    for(int i=0;i<4;i++)begin
      a=$random();
      b=$random();
      cs.sample();
      $display("a=%0d b=%0d coverage=%.2f %%",a,b,cs.get_inst_coverage());
    end
  end
endmodule 

// # a=4 b=1 coverage=12.50 %
// # a=1 b=3 coverage=25.00 %
// # a=5 b=5 coverage=37.50 %
// # a=5 b=2 coverage=43.75 %
