//without virtual keyword

class parent_class;
  int i=3;
  function int init();
    init=i;
  endfunction
endclass

class child_class extends parent_class;
  int i=2;
  function int init();
    init=-i;
  endfunction
endclass

module m1;
  int j;
  child_class c1;
  parent_class p1;
  initial begin
    c1=new();
    c1.init();
    p1=c1;//upcasting which is child class assignned to parent class and considered as object because of chid class creatted object : 
    $display("i=%0d",p1.i);
    j=p1.init();
    $display("j=%0d",j);// cannot override the function ,there is no use of override here
    $display("i=%0d",c1.init());
  end
endmodule
// # i=3
// # j=3
// # i=-2

//with virtual keyword

class parent_class;
   int i=4;
  virtual function int init();// virtual method
    init=i;
  endfunction
endclass

class child_class extends parent_class;
  int i=5;
  function int init();
    init=-i;
  endfunction
endclass

module m1;
  int j;
  child_class c1;
  parent_class p1;
  initial begin
    c1=new();
    j=c1.init();
    $display("j=%0d",j);
    
    p1=c1;
    $display("i=%0d",p1.i);
    j=p1.init();
    $display("j=%0d",j);// here overrdie the parent function using virtual method
  end
endmodule
// // # j=-5
// // # i=4
// // # j=-5


class parent_class;
  string name;
  int id;
  int data;
  int addr;
  
  function new();
    name="dinesh";
    id=12;
    data=345;
    addr=678;
  endfunction
 virtual function void display();
    $display("name=%s \nid=%0d \ndata=%0d \naddr=%0d ",name,id,data,addr);
    
  endfunction
endclass

class child_class extends parent_class;
  string name;
  int id;
  int data;
  int addr;
  
  function new();
    name="zzzzz";
    id=98;
    data=76;
    addr=34;
  endfunction
  function void display();
    $display("name=%s \nid=%0d \ndata=%0d \naddr=%0d",name,id,data,addr);
  endfunction
endclass

class child_class_1 extends child_class;
  string name;
  int id;
  int data;
  int addr;
  int label;
  function new();
    name="babu";
    id=1;
    data=9;
    addr=23;
    label=13;
  endfunction
  
  function void display();
    $display("name=%s \nid=%0d \ndata=%0d \naddr=%0d \nlabel=%0d",name,id,data,addr,label);
  endfunction
endclass
    
module m1;
  child_class c1;
  child_class_1 c2;
  parent_class p1,p2;
  initial begin
    
    c1=new();
    p1=c1;//upcasting
    $display("child_class method");
    
    p1.display();
    $display("\n");
    c2=new();
    $display("parent class override");
    c1.display();
     $display("\n");
    $display("child_class_1 method");
    c2.display();
    $display("\n");
    p2=c2;
      $display("parent class override");
    p2.display();
  end
endmodule


// child_class method
// # name=zzzzz 
// # id=98 
// # data=76 
// # addr=34
// # 
// # 
// # parent class override
// # name=zzzzz 
// # id=98 
// # data=76 
// # addr=34
// # 
// # 
// # child_class_1 method
// # name=babu 
// # id=1 
// # data=9 
// # addr=23 
// # label=13
// # 
// # 
// # parent class override
// # name=babu 
// # id=1 
// # data=9 
// # addr=23 
// # label=13
  
