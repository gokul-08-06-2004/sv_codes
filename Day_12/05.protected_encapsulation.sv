//protected keyword in encapsulation:
//public class
class bus;
  string bus_name;
  int bus_number;
  string cooler;
  int capacity;
  int engine_cc;
  
  function int details();
    bus_name="mrk_travels";
    bus_number=2;
    cooler="AC sleeper coach";
    capacity=54;
    engine_cc=350;
    display();
  endfunction
  
  function void display();
  $display("bus_name=%s \nbus_number=%0d \ncooler=%s \ncapacity=%0d \nengine_cc=%0d",bus_name,bus_number,cooler,capacity,engine_cc);
  endfunction
endclass

class bus_1 extends bus;
  function int details();
    bus_name="krishna travels";
    bus_number=3;
    cooler="AC sleeper coach";
    capacity=64;
    engine_cc=400;
    display();
  endfunction
  function void display();
  $display("bus_name=%s \nbus_number=%0d \ncooler=%s \ncapacity=%0d \nengine_cc=%0d",bus_name,bus_number,cooler,capacity,engine_cc);
  endfunction
endclass

module m1;
  bus b1;
  bus_1 b2;
  initial begin;
    b1=new();
    b2=new();
    
    b1.details();
    $display("\n");
    b2.details();
    
  end
endmodule
   # bus_name=mrk_travels 
# bus_number=2 
# cooler=AC sleeper coach 
# capacity=54 
# engine_cc=350
# 
# 
# bus_name=krishna travels 
# bus_number=3 
# cooler=AC sleeper coach 
# capacity=64 
# engine_cc=400


using protected become error:

class c;
  protected int number;
  protected int id;
  protected bit [7:0]data;
  
  function int person(int number,int id,bit[7:0]data);
    this.number=number;
    this.id=id;
    this.data=data;
  endfunction
  
  function void display();
    $display("number=%0d id=%0d data=%0d",number,id,data);
  endfunction
endclass

class b extends c;
  
  function int person(int number,int id,bit[7:0]data);
    this.number=number;
    this.id=id;
    this.data=data;
  endfunction
  
  function void display();
    $display("number=%0d id=%0d data=%0d",number,id,data);
  endfunction
endclass

module m1;
  c c1;
  b b1;
  initial begin
    c1=new();
    b1=new();
    
    c1.number=20;
    c1.id=10;
    c1.data=30;
    
    c1.person(c1.number,c1.id,c1.data);
    c1.display();
  end
endmodule
//      Illegal access to protected member number.
//   Illegal access to protected member id.
//  Illegal access to protected member data.
    //it become error

// using protected in sub class only not used outside the class it become error:
----------------------------------------------------------------------------------------------------

class c;
  protected int number;
  protected int id;
  protected bit [7:0]data;
  
  function int person(int number,int id,bit[7:0]data);
    this.number=number;
    this.id=id;
    this.data=data;
  endfunction
  
  function void display();
    $display("number=%0d id=%0d data=%0d",number,id,data);
  endfunction
endclass

class b extends c;
  
  function int person(int number,int id,bit[7:0]data);
    this.number=number;
    this.id=id;
    this.data=data;
  endfunction
  
  function void display();
    $display("number=%0d id=%0d data=%0d",number,id,data);
  endfunction
endclass

module m1;
  c c1;
  b b1;
  initial begin
    c1=new();
    b1=new();

    c1.person(10,20,30);
    c1.display();
  end
endmodule
// # number=10 id=20 data=30
