class address_range;
  
  string client_name;
  int addr;
  int data;
  
  function new();
    client_name="Gokul";
    addr=20;
    data=10;
  endfunction
endclass

class packet;
  bit[9:0] ph_number;
  int id;
  address_range ad_r;
  
  function new();
    ph_number='1;
    id=1;
    ad_r=new();
  endfunction
  
  function void display();
    $display("client_name=%s \naddr=%0d \ndata=%0d \nph_number=%b \nid=%0d \n",ad_r.client_name,ad_r.addr,ad_r.data,ph_number,id);
  endfunction
endclass

module tb;
  packet pkt_1,pkt_2;
  initial begin
    
    pkt_1=new();
    pkt_1.display();
    
    pkt_2=new pkt_1;//shallow copy
    pkt_2.display();
    
    pkt_2.ad_r.addr=40;
    pkt_2.ph_number='0;
    pkt_2.id=2;
    pkt_1.display();
    pkt_2.display();
  end
endmodule

// # client_name=Gokul 
// # addr=20 
// # data=10 
// # ph_number=1111111111 
// # id=1 
// # 
// # client_name=Gokul 
// # addr=20 
// # data=10 
// # ph_number=1111111111 
// # id=1 
// # 
// # client_name=Gokul 
// # addr=40 
// # data=10 
// # ph_number=1111111111 
// # id=1 
// # 
// # client_name=Gokul 
// # addr=40 
// # data=10 
// # ph_number=0000000000 
// # id=2

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
    
    c2.data=10;
    c2.ad_r.addr=50;
    $display("data=%0d addr=%0d",c1.data,c1.ad_r.addr);
    $display("data=%0d addr=%0d",c2.data,c2.ad_r.addr);
    
    
  end
endmodule

// # data=20 addr=30
// # data=20 addr=30
// # data=20 addr=50
// # data=10 addr=50

