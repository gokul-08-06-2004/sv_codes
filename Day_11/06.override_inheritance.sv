//override the parent class method in child class without distrubing the parent class
class stealer;
  string prison_name;
  int lock_up_number;
  int room_number;
  //new with default arugument is complsory for override
  function new(string prison_name="trichy",int lock_up_number=20,int room_number=30);
    this.prison_name=prison_name;
    this.lock_up_number=lock_up_number;
    this.room_number=room_number;
  endfunction
 
endclass

class cyber_security extends stealer;
  int addr;
 
  
  function new(string prison_name,int lock_up_number,int room_number,int addr);
    this.prison_name=prison_name;
    this.lock_up_number=lock_up_number;
    this.room_number=room_number;
    this.addr=addr;
  endfunction
  
  function void display();
    $display("prison_name=%s \nlock_up_number=%0d \nroom_number=%0d \naddr=%0d",this.prison_name,this.lock_up_number,this.room_number,this.addr);
  endfunction
  
endclass

module m1;
  cyber_security c1;
  initial begin
    
    c1=new("madras_prison",34,20,11);
    c1.display();
  end
endmodule
// reason 
// SystemVerilog automatically inserts at the top of child constructor:
// super.new();   // zero-argument call
// Error occurs: parent requires 3 arguments → cannot call super.new() implicitly.
// This is exactly the error you get without default values.


class stealer;
  string prison_name;
  int lock_up_number;
  int room_number;
  
  function f1(string prison_name="cc",int lock_up_number=60,int room_number=34);
    this.prison_name=prison_name;
    this.lock_up_number=lock_up_number;
    this.room_number=room_number;
  endfunction
  
  function void display();
       $display("prison_name=%s \nlock_up_number=%0d \nroom_number=%0d ",this.prison_name,this.lock_up_number,this.room_number);
  endfunction
 
endclass

class cyber_security extends stealer;
 int addr;
  function f1(string prison_name,int lock_up_number,int room_number,int addr);
    this.prison_name=prison_name;
    this.lock_up_number=lock_up_number;
    this.room_number=room_number;
    this.addr=addr;
  endfunction
  
  function void display();
    $display("prison_name=%s \nlock_up_number=%0d \nroom_number=%0d \naddr=%0d ",this.prison_name,this.lock_up_number,this.room_number,this.addr);
  endfunction
  
endclass

module m1;
  stealer c2;
  cyber_security c1;
  initial begin
    c1=new();
    c1.f1("madras_prison",34,20,11);
    c1.display();
    c2=new();
    c2.f1();
    c2.display();
  end
endmodule
//   # prison_name=madras_prison 
// # lock_up_number=34 
// # room_number=20 
// # prison_name=cc 
// # lock_up_number=34 
// # room_number=4
