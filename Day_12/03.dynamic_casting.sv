//downcasting or dynamic casting or runtime:
//without using dynamic casting

class protocol;
  string name;
  string duplex;
  int mphs;
 
  virtual function int communication(string name,string duplex,int mphs);
    this.name=name;
    this.duplex=duplex;
    this.mphs=mphs;
  endfunction
endclass

class protocol_1 extends protocol;
//   string name;
//   string duplex;
//   int mphs;
 
  function int communication(string name,string duplex,int mphs);
    this.name=name;
    this.duplex=duplex;
    this.mphs=mphs;
  endfunction
endclass


module m1;
  protocol p1;
  protocol_1 p2;
  initial begin
    p1=new();
    p1.communication("uart","full_duplex",1);
    $display("name=%s duplex=%s mphs=%0d",p1.name,p1.duplex,p1.mphs);
    
    p2=new();
    p2.communication("spi","full_duplex",50);
    $display("name=%s duplex=%s mphs=%0d",p2.name,p2.duplex,p2.mphs);
    
    p1=p2;//upcasting
    p2.communication("spi","full_duplex",50);
    $display("name=%s duplex=%s mphs=%0d",p1.name,p1.duplex,p1.mphs);
    
   p1=p2;
    $cast(p2,p1);//proper downcasting 
    p2.communication("spi","full_duplex",50);
    $display("name=%s duplex=%s mphs=%0d",p1.name,p1.duplex,p1.mphs);
    

    p2=p1;//parent class assigned to child class it may cause runtime error because  parent class do not assigned to child class
    p2.communication("spi","full_duplex",50);
    $display("name=%s duplex=%s mphs=%0d",p1.name,p1.duplex,p1.mphs);
    
    
  end
endmodule
