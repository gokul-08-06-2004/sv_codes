//class hacker access the properties and methods from class person_data
class person_data;
  string name;
  int id;
  
  function f1();
    name="zzzz";
    id=234;
  endfunction
  function void copy_cat();
    $display("name=%s \nid=%0d",name,id);
  endfunction
endclass
  class hacker extends person_data;
    bit[7:0]addr;
    bit[9:0]ph_number;

    function f2();
      addr=50;
      ph_number='1;
    endfunction
    
    function void display();
      $display("name=%s \nid=%0d \naddr=%0d \nph_number=%b",name,id,addr,ph_number);
    endfunction
  endclass
  
  module m1;
    hacker h1;
    initial begin
      h1=new();
      h1.f1();
      h1.f2();
      //h1.copy_cat();
      h1.display();
    end
  endmodule 
// # name=zzzz 
// # id=234
// # addr=50 
// # ph_number=1111111111


//override the parent class method in child class without distrubing the parent class without using super keyword
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
