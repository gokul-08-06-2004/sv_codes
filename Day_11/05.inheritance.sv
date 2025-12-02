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


