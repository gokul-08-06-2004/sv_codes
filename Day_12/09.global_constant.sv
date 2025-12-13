// global constant variable 

class monitor;
  string name;
  const int addr=10;//global constant
  int data;
  
  function new();
    name="boiiz";
    data=300;
  endfunction
  function void display();
    $display("name=%s \naddr=%0d \ndata=%0d",name,addr,data);
  endfunction
endclass

module global_constant;
  monitor m1;
  initial begin
    m1=new();
    m1.display();
  end
endmodule

// output:
// # name=boiiz 
// # addr=10 
// # data=300

global constant with static
  class monitor;
  static string name;
  static const int addr=10;//global constant
  static int data;
  
 static function f1();
    name="boiiz";
    data=300;
  endfunction
  static function void display();
    $display("name=%s \naddr=%0d \ndata=%0d",name,addr,data);
  endfunction
endclass

module global_constant;
  monitor m1;
  initial begin
  
    monitor::f1();
    monitor::display();
  end
endmodule

// output:
// # name=boiiz 
// # addr=10 
// # data=300

// global constant variable 

class monitor;
  string name;
  const int addr=10;//global constant
  int data;
  
  function new();
    name="boiiz";
    data=300;
  endfunction
  function void display();
    $display("name=%s \naddr=%0d \ndata=%0d",name,addr,data);
  endfunction
endclass

module global_constant;
  monitor m1;
  initial begin
    m1=new();
    m1.display();
    m1.addr=20;//cannot override the constant global variable:
    m1.display();
  end
endmodule
// Variable 'addr' is const
// ** Error: testbench.sv(80): Variable 'addr' is const
// ** Error: testbench.sv(80): (vlog-13514) Illegal LHS of assignment.
