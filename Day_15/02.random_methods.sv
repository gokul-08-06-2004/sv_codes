// normal random methodes:
// $random methods
class details;
  
  int data;
  int addr;
  int num;

  function new();
    data=$random();
    addr=$random();
    num=$random();
    $display("data=%0d addr=%0d name=%0d",data,addr,num);
  endfunction
endclass

module m1;
  details d1;  
  initial begin
    for(int i=0;i<10;i++)begin
      d1=new();
    end
  end
endmodule

// $urandom

module address;
  string name="";
 
  initial begin
    for(int i=0;i<6;i++)begin
      byte ch;
      ch=$urandom_range("A","Z");
      name={name,ch};
      $display("name=%s",name);
    end
//     $display("name=%s",name);
  end
endmodule
//   name = {name, ch};
// This is VERY IMPORTANT
// {a , b} = concatenation in SystemVerilog
// Meaning:
// New name = previous name + new character
  
class car;
 string name="";
  int addr;
  int data;
  int car_no;
  byte ch;
  function new();
    addr=$random;
    data=$random;
    car_no=$random;
    for(int i=0;i<6;i++)begin 
      ch=$urandom_range("A","Z");
      name={name,ch};
    end
    $display("name=%s addr=%0d data=%0d car_no=%0d",name,addr,data,car_no);
  endfunction
endclass

module m1;
  car c1;
  initial begin
    for(int i=0; i<6;i++)begin
    c1=new();
    end
  end
endmodule

// # name=FUKNYK addr=303379748 data=-1064739199 car_no=-2071669239
// # name=KUCISD addr=-1309649309 data=112818957 car_no=1189058957
// # name=EHPBQM addr=-1295874971 data=-1992863214 car_no=15983361
// # name=CJEIWR addr=114806029 data=992211318 car_no=512609597
// # name=YIEHXG addr=1993627629 data=1177417612 car_no=2097015289
// # name=CIBBYO addr=-482925370 data=-487095099 car_no=-720121174
