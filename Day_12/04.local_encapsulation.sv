// //encapsulation:
// //without using local
class marks;
  string name;
  int mark;
  int percentage;
  
  function int stu_1();
    name ="kamal";
    mark=80;
    percentage=40;
    display();
  endfunction
  
  function void display();
    $display("student=%s \nmark=%0d \npercentage=%0d",name,mark,percentage);
  endfunction
endclass

class marks_1 extends marks;
  
  function int stu_2();
    name="vimal";
    mark=70;
    percentage=20;
    display();
  endfunction
  
  function void display();
    $display("student=%s \nmark=%0d \npercentage=%0d",name,mark,percentage);
  endfunction
endclass

module m1;
  marks m1;
  marks_1 m2;
  initial begin
    m1=new();
    m2=new();
    m1.stu_1();
    m2.stu_2();
  end
endmodule

//  student=kamal 
// # mark=80 
// # percentage=40
// # student=vimal 
// # mark=70 
// # percentage=20

//encapsulation :
//with using local
class marks;
  local string name;
  local int mark;
  local int percentage;
  
  function int stu_1();
    name ="kamal";
    mark=80;
    percentage=40;
    display();
  endfunction
  
  function void display();
    $display("student=%s \nmark=%0d \npercentage=%0d",name,mark,percentage);
  endfunction
endclass

class marks_1 extends marks;
  
  function int stu_2();
    name="vimal";
    mark=70;
    percentage=20;
    display();
  endfunction
  
  function void display();
    $display("student=%s \nmark=%0d \npercentage=%0d",name,mark,percentage);
  endfunction
endclass

module m1;
  marks m1;
 marks_1 m2;
  initial begin
    m1=new();
   m2=new();
    m1.stu_1();
    m2.stu_2();
  end
endmodule
//  Illegal access to local member name. Illegal access to local member mark. Illegal access to local member percentage.//it make an error:


//without error using local

class area;
  
  local int a,b;
  local int out;
  function int square();
    a=10;
    b=20;
    out=a**2;
    display();
  endfunction
  
  function void display();
    $display("a=%0d \nb=%0d \narea of square=%0d",a,b,out);
  endfunction
endclass

module m1;
  area s1;
  initial begin
    s1=new();
    s1.square();
  end
endmodule
// # a=10 
// # b=20 
// # area of square=100
