// Code your testbench here
// or browse Examples
class classA;
  bit[7:0]addr;
endclass

class classB;
  bit[7:0]data;
  classA ad_r;
endclass

module m1;
  classB c1,c2;
  initial begin
    c1=new();
    c1.ad_r=new();
    
    c1.data=20;
    c1.ad_r.addr=30;
 
    c2=new c1;
       $display("data=%0d addr=%0d",c1.data,c1.ad_r.addr);
        $display("data=%0d addr=%0d",c2.data,c2.ad_r.addr);
    c2.ad_r=new c1.ad_r;
    
    c2.data=30;
    c2.ad_r.addr=40;
       $display("data=%0d addr=%0d",c1.data,c1.ad_r.addr);
    $display("data=%0d addr=%0d",c2.data,c2.ad_r.addr);
  end
endmodule

// # data=20 addr=30
// # data=20 addr=30
// # data=20 addr=30
// # data=30 addr=40

class classA;
  bit[7:0]addr;
endclass

class classB;
  bit[7:0]data;
  classA ad_r;
  
  function copy(classA inst);
    ad_r=new inst;
  endfunction
endclass

module m1;
  classB c1,c2;
  initial begin
    c1=new();
    c1.ad_r=new();
      
    c1.data=30;
    c1.ad_r.addr=50;
    c2=new c1;
    c2.copy(c1.ad_r);
    $display("data=%0d addr=%0d",c1.data,c1.ad_r.addr);
    $display("data=%0d addr=%0d",c2.data,c2.ad_r.addr);
    
    c2.data=40;
    c2.ad_r.addr=60;
     $display("data=%0d addr=%0d",c1.data,c1.ad_r.addr);
        $display("data=%0d addr=%0d",c2.data,c2.ad_r.addr);
  end
endmodule


// Code your testbench here
// or browse Examples
class classA;
  int addr;
  int data;
  
  function new();
    addr=10;
    data=20;
  endfunction 
  //copy method
  function classA copy();
    copy=new();
    copy.addr=this.addr;
    copy.data=this.data;
    return copy;
  endfunction
endclass

class classB;
  int s_addr;
  int s_data;
  classA ar;
  
  function new();
    s_addr=40;
    s_data=50;
    ar=new();//class handle
  endfunction
     function void display();
       $display("--------------------------------------");
       $display("addr=%0d data=%0d s_addr=%0d s_data=%0d",ar.addr,ar.data,s_addr,s_data);
       $display("--------------------------------------");
  endfunction
 
  function classB copy();
    copy=new();
    copy.s_addr=this.s_addr;
    copy.s_data=this.s_data;
    copy.ar=ar.copy;//calling copy from classA to classB
    return copy;
  endfunction
endclass

module m1;
  classB c1,c2;
  initial begin
    c1=new();
    c1.display();
   c2=new();
    c2.display();
   // c2=c1.copy();
    
    c2.s_addr=23;
    c2.ar.addr=24;
    c2.ar.data=25;
    c1.display();
    c2.display();
  end
endmodule
