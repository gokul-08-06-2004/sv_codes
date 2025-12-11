//access class properties in another class using scope resolution
class emp_salary;
  string name;
  int position;
  int salary;
  
  function f1();
   name="mahi";
   position =1;
   salary=1000000;
    $display("name=%s \nposition=%0d \nsalary=%0d",name,position,salary);
  endfunction
endclass

class emp_details extends emp_salary;
  int addr;
  int data;
  
  function f1();
    emp_salary::f1();
    addr=123;
    data=845;
    $display("addr=%0d \ndata=%0d \n",addr,data);
  endfunction
endclass

module m1;
  emp_details e1;
  initial begin
    e1=new();
    e1.f1;
    e1.name="kalish";//cannot override
    e1.f1;
  end
endmodule

// # name=mahi 
// # position=1 
// # salary=1000000
// # addr=123 
// # data=845 
// # 
// # name=mahi 
// # position=1 
// # salary=1000000
// # addr=123 
// # data=845
