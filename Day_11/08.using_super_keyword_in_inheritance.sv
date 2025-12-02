// // //without super keyword:

class stage_1;
  
  int add;
  int sub;
  
  function f1(int a, int b);
    add=a+b;
    sub=a-b;
  endfunction
  
endclass

class stage_2 extends stage_1;
  int mul;
  function f1(int a,int b);
    mul=a*b;
  endfunction
    function void display();
       $display("add=%0d sub=%0d mul=%0d",add,sub,mul);
  endfunction

endclass

module m1;
  stage_2 s1;
  initial begin
    s1=new();
    s1.f1(2,4);
//     $display("add=%0d sub=%0d mul=%0d",s1.add,s1.sub,s1.mul);
    s1.display();
  end
endmodule
//# add=0 sub=0 mul=8

//with super keyword

class stage_1;
  
  int add;
  int sub;
  
  function f1(int a, int b);
    add=a+b;
    sub=a-b;
  endfunction
  
endclass

class stage_2 extends stage_1;
  int mul;
  function f1(int a,int b);
    super.f1(3,4);
    mul=a*b;
  endfunction
    function void display();
       $display("add=%0d sub=%0d mul=%0d",add,sub,mul);
  endfunction

endclass

module m1;
  stage_2 s1;
  initial begin
    s1=new();
    s1.f1(2,4);
    s1.display();
    
  end
endmodule
# add=7 sub=-1 mul=8

with super keyword in constructor:

class stage_1;
  
  int add;
  int sub;
  
  function new();
    add=30;
    sub=40;
  endfunction
  
endclass

class stage_2 extends stage_1;
  int mul;
  function new();
    // super.new();// default for child class constructor:
    mul=60;
  endfunction
  function void display();
       $display("add=%0d sub=%0d mul=%0d",add,sub,mul);
  endfunction

endclass

module m1;
  stage_2 s1;
  initial begin
    s1=new();
    s1.display();
  end
endmodule
// # add=30 sub=40 mul=60
