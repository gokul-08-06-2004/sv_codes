//parameterized mailbox;

class c1;
  string passenger_name;
  string bus_name;
  int a;
  mailbox#(string) m;
  mailbox n;
  function new(mailbox#(string) m1,mailbox n1);
    this.m=m1;
    this.n=n1;
  endfunction
  
  task trans_data();
    
    passenger_name="makesh";
    bus_name="ganesh";
    m.put(passenger_name);
    m.put(bus_name);
    $display("passenger_name=%s \nbus_name=%s",passenger_name,bus_name);
    
    passenger_name="rakesh";
    bus_name="AK";
    m.put(passenger_name);
    m.put(bus_name);
    $display("passenger_name=%s \nbus_name=%s",passenger_name,bus_name);
    
    passenger_name="gurupandiyan";
    bus_name="akash";
    m.put(passenger_name);
    m.put(bus_name);
    $display("passenger_name=%s \nbus_name=%s",passenger_name,bus_name);
    
    for(int i=0;i<=6;i++)begin
      if(n.num()==6)
        $display("mailbox is finished");
      else begin
        a++;
        n.put(a);
        $display("trans_data=%0d",a);
      end
    end
  endtask
endclass


class c2;
  string passenger_name;
  string bus_name;
  int a;
  mailbox#(string)m;
  mailbox n;
  function new(mailbox#(string) m2,mailbox n2);
    this.m=m2;
    this.n=n2;
  endfunction
  
  task receive_data();
    m.get(passenger_name);
    m.get(bus_name);
    $display("passenger_name=%s \nbus_name=%s",passenger_name,bus_name);

    m.get(passenger_name);
    m.get(bus_name);
    $display("passenger_name=%s \nbus_name=%s",passenger_name,bus_name);  
    
    m.get(passenger_name);
    m.get(bus_name);
    $display("passenger_name=%s \nbus_name=%s",passenger_name,bus_name);
    
    for(int i=0;i<6;i++)begin
      n.get(a);
      $display("recevie_data=%0d",a);
    end
  endtask
endclass


module parameterized_mailbox;
  c1 m1;
  c2 m2;
  mailbox #(string) mb;
  mailbox nb;
  initial begin
    mb=new(6);
    nb=new(6);
    m1=new(mb,nb);
    m2=new(mb,nb);
    
    m1.trans_data();
    $display("=============================================");
    m2.receive_data();
  end
endmodule 

// # passenger_name=makesh 
// # bus_name=ganesh
// # passenger_name=rakesh 
// # bus_name=AK
// # passenger_name=gurupandiyan 
// # bus_name=akash
// # trans_data=1
// # trans_data=2
// # trans_data=3
// # trans_data=4
// # trans_data=5
// # trans_data=6
// # mailbox is finished
// # =============================================
// # passenger_name=makesh 
// # bus_name=ganesh
// # passenger_name=rakesh 
// # bus_name=AK
// # passenger_name=gurupandiyan 
// # bus_name=akash
// # recevie_data=1
// # recevie_data=2
// # recevie_data=3
// # recevie_data=4
// # recevie_data=5
// # recevie_data=6
