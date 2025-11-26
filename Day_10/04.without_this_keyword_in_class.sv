class without_this_keyword;// without using this you can not access from one constructor to another constructor it may cause default value
  
  string name;
  int phone_number;
  bit [3:0]room_no;
  int addr;
  bit [3:0]roll_number;
  
  function f1(string name,int phone_number,bit [3:0]room_no,int addr,bit [3:0]roll_number);//here use object
//Inside the function:
// name means local function argument, not class property.
// phone_number means local function argument, not class property.
// room_no means local function argument, not class property**.
    name=name;
    phone_number=phone_number;
    room_no=room_no;
    addr=addr;
    roll_number=roll_number;
    
  endfunction
  function void display();//The function arguments hide the class properties
       $display("name=%s \nphone_number=%0d \nroom_no=%0d \naddr=%0d \nroll_number=%0d",name,phone_number,room_no,addr,roll_number);
  endfunction
  endclass

module m1;
  without_this_keyword w1;
  initial begin
    w1=new();
    w1.f1("gokul",234445,4,23/4,121);
    w1.display();
  end
endmodule
// Class properties stay at default values:
// name → empty string
// phone_number → 0
// room_no → 0
// addr → 0
// roll_number → 0
// That is why w1.display() prints all default values.
