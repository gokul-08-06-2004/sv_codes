
// std::randomize():

module m1;
  bit[3:0]a;
  bit[3:0]b;
  bit[3:0]c;
  bit[3:0]d;
  bit[3:0]e;
  
  initial begin
    
    repeat(5)begin
      std::randomize(a);
      $display("a=%0d",a);
      std::randomize(b,c);
      $display("b=%0d c=%0d",b,c);
      std::randomize(d,e);
      $display("d=%0d e=%0d",d,e);
      $display("-------------------------");
      
    end
  end
endmodule

//std::randomize() using inside class

class random;
  rand bit[7:0]a;
  rand bit[7:0]b;
  constraint c1{a>=2;a<=9;};
  
  function void display();
    int c;
    
    void'(std::randomize(this));
      $display("a=%0d b=%0d ",a,b);
    if(randomize(a))
      $display("a=%0d",a);
    if(randomize(b))
      $display("b=%0d",b);
    if(std::randomize(a))
      $display("a=%0d",a);
    if(std::randomize(b))
      $display("b=%0d",b);
    if(std::randomize(c)with{c>2;c<9;})
      $display("c=%0d",c);
    void'(randomize());
    $display("a=%0d b=%0d c=%0d",a,b,c);
    void'(this.randomize());
    $display("a=%0d b=%0d c=%0d",a,b,c);
    $display("---------------------------------------");
  endfunction
endclass

module m1;
  random r1;
  initial begin
    r1=new();
    repeat(3)begin
      r1.display();
    end
  end
endmodule

// # KERNEL: a=154 b=181 
// # KERNEL: a=5
// # KERNEL: b=246
// # KERNEL: a=74
// # KERNEL: b=85
// # KERNEL: c=4
// # KERNEL: a=2 b=13 c=4
// # KERNEL: ---------------------------------------
// # KERNEL: a=232 b=2 
// # KERNEL: a=8
// # KERNEL: b=102
// # KERNEL: a=34
// # KERNEL: b=162
// # KERNEL: c=6
// # KERNEL: a=7 b=234 c=6
// # KERNEL: ---------------------------------------
// # KERNEL: a=27 b=219 
// # KERNEL: a=5
// # KERNEL: b=67
// # KERNEL: a=204
// # KERNEL: b=47
// # KERNEL: c=8
// # KERNEL: a=2 b=64 c=8
// # KERNEL: ---------------------------------------
