class normal_class;
// with using this keyword to calling constructor to another constructor  it makes reuse the code in same class
  string name;
  int phone_number;
  bit [3:0]room_no;
  int addr;
  bit [3:0]roll_number;
  // this keyword refer the current object of properties and methods
  function f1(string name,int phone_number,bit [3:0]room_no,int addr,bit [3:0]roll_number);
    this.name=name;
    this.phone_number=phone_number;
    this.room_no=room_no;
    this.addr=addr;
    this.roll_number=roll_number;
           
  endfunction
  function void display();//here the this keyword is used for calling f1 method to display method 
    $display("name=%s \nphone_number=%0d \nroom_no=%0d \naddr=%0d \nroll_number=%0d",this.name,this.phone_number,this.room_no,this.addr,this.roll_number);
  endfunction

  endclass

module normal_class_with_object;
  normal_class w1;
  initial begin
    w1=new();
    w1.f1("gokul",234445,4,23/4,121);
    w1.display();
  end
endmodule


//another example
class brand;
  string model_name;
  int model_number;
  // call f2 method to f1 method using this_keyword inside the class
  function f1(string model_name,int model_number);
//     this.f2("benz",model_number);
    this.model_name=model_name;
    this.model_number=model_number;
  endfunction
  
  function f2(string model_name,int model_number);
   this.model_name=model_name;
   this.model_number=model_number;
  endfunction
  
  function void display();
    $display("model_name=%s model_number=%0d",model_name,model_number);
  endfunction
endclass
  module with_this_keyword;
    brand b1,b2;
    initial begin
      b1=new();
      b1.f1("ferrai",2025);
      b2=new();
      b2.f2("lamogini",2026);
      b1.display();
      b2.display();
    end
  endmodule
