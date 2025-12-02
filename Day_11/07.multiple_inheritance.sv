//multiple inheritance

class parent_class;

  function int add(int a,b);
    add=a+b;
    $display("a=%0d b=%0d add=%0d",a,b,add);
  endfunction
endclass

class child_class_1 extends parent_class;
 
  function int sub(int a,b);
    sub=a-b;
    $display("a=%0d b=%0d sub=%0d",a,b,sub);
  endfunction
endclass

class child_class_2 extends child_class_1;
  
  function int mul(int a,b);
    mul=a*b;
   $display("a=%0d b=%0d mul=%0d",a,b,mul);
  endfunction
endclass

module m1;
  child_class_2 c1;
  initial begin
    c1=new();
    c1.add(4,5);
    c1.sub(3,2);
    c1.mul(2,3);
  end
endmodule
// # a=4 b=5 add=9
// # a=3 b=2 sub=1
// # a=2 b=3 mul=6


class parent_class;
  int add;
  function int fun_1(int a,b);
    add=a+b;
  endfunction
endclass

class child_class_1 extends parent_class;
  int sub;
  function int fun_2(int a,b);
    sub=a-b;
  endfunction
endclass

class child_class_2 extends child_class_1;
  int mul;
  function int fun_3(int a,b);
    mul=a*b;
  endfunction
endclass

module m1;
  child_class_2 c1;
  initial begin
    c1=new();
    c1.fun_1(3,5);
    c1.fun_2(3,4);
    c1.fun_3(3,2);
    $display("add=%0d sub=%0d mul=%0d",c1.add,c1.sub,c1.mul);
  end
endmodule
//  //add=8 sub=-1 mul=6
