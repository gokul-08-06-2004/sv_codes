virtual class vehicle;// without virtual is static binding and with virtual is dynamic binding
  
  virtual function void brand();//prototype are virtual class and this common for all child class method  
  endfunction
  
  virtual function  features();
    string bike_name;
    int model;
    int cc;
  endfunction
endclass

class car extends vehicle;
  
  function void brand();
    $display("car details");
  endfunction
  
  function  features();
    string bike_name="ferrai";
    int model=2026;
    int cc=1000;
    $display("bike_name=%s model=%0d cc=%0d",bike_name,model,cc);
  endfunction  
endclass


class bike extends vehicle;
  function void brand();
    $display("bike details");
  endfunction
  
  function features();
    string bike_name="duke";
    int model=2025;
    int cc=250;
    $display("bike_name=%s model=%0d cc=%0d",bike_name,model,cc);
  endfunction
endclass

module m1;
  car c1;
  bike b1;
  initial begin
    c1=new();
    b1=new();
    c1.brand();
    c1.features();
    b1.brand();
    b1.features();
  end
endmodule
// ⭐ Two Types of Binding
// 1. Without virtual → Static Binding
// Function is selected based on the handle type, NOT object type.
// 2. With virtual → Dynamic Binding
// Function is selected based on the object type.

//without virtual class is static class 

class book;
  
  function void brand();
  endfunction
  
  function features();
    string book_name;
    int pages;
    int copies;
  endfunction
endclass

class book_1 extends book;
  function void brand();
    $display("book_1");
  endfunction
  
  function features();
    string book_name="digital";
    int pages=120;
    int copies=3;
    $display("book_name=%s pages=%0d copies=%0d",book_name,pages,copies);
  endfunction
endclass

class book_2 extends book;
  function void brand();
    $display("book_2");
  endfunction
  
  function features();
    string book_name="verilog";
    int pages=230;
    int copies=4;
    $display("book_name=%s pages=%0d copies=%0d",book_name,pages,copies);
  endfunction
endclass

module m1;
  book_1 b1;
  book_2 b2;
  initial begin
    b1=new();
    b2=new();
    b1.brand();
    b1.features();
    b2.brand();
    b2.features();
  end
endmodule

-----------------------------------------------------------------------------------

//pure virtual method
//pure virtual method 

virtual class shape;
  
  int a,b,l,h,i;
  pure virtual function int area();
    pure virtual function void display();
endclass
      
      
      class square extends shape;
        function int area();//same as parent class method ,donot mention any variable inside parathesis:
          i=a**2;
        endfunction
        function void display();
          $display("area of aquare=%0d",i);
        endfunction
      endclass
      
      class rectangle extends shape;
        function int area();
          i=l*b;
        endfunction
        
        function void display();
          $display("area of rectangle =%0d",i);
        endfunction
      endclass
      
      class triangle extends shape;
        function int area();
          i=b*h;
        endfunction
        function void display();
          $display("area of triangle=%0d",i);
        endfunction
      endclass
      
      module m1;
        square s1;
        rectangle r1;
        triangle t1;
        
        initial begin
          s1=new();
          r1=new();
          t1=new();
          s1.a=2;
          s1.area();
          s1.display();
          r1.l=23;
          r1.b=1;
          r1.area();
          r1.display();
          t1.b=3;
          t1.h=4;
          t1.area();
          t1.display();
          
        end
      endmodule
        
        
//   area of aquare=4
// # area of rectangle =23
// # area of triangle=12
