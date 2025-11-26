// Code your testbench here
// or browse Examples
class home;
  bit light;
  bit fan;
  string switch;
  
  function f1();
    switch="on";
    $display("switch is %s",switch);
  endfunction
endclass

module m1;
  home h1;
  initial begin
    h1=new();
    h1.f1();
    h1.light=1;
    h1.fan=1;
    $display("light is %0d(on) and fan is also %0d(on)",h1.light,h1.fan);
  end
endmodule


class bank_details;
  string user_name,bank_name;
  int bank_number;
  int account_number;
  bit [9:0]phone_number;
  string address;
  int a,b;
  
  function f1(int a,b);
    bank_number=a*2+b*2;
    account_number=b*10000+a*234;
    phone_number='1;
    address="chennai";
    
    $display("bank_number=%0d \naccount_number=%0d \nphone_number=%b \naddress=%s",bank_number,account_number,phone_number,address);
  endfunction
endclass

module m1;
  bank_details b1;
  initial begin
    b1=new();
    b1.user_name="gokul";
    b1.bank_name="xxxx";
    $display("user_name=%s \nbank_name=%s",b1.user_name,b1.bank_name);
    b1.f1(3,5);
  end
endmodule
