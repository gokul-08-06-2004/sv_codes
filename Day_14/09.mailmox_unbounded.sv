//unbounded mailbox;

class c1;
  int a;
  mailbox m;
  
  function new(mailbox m1);
    this.m=m1;
  endfunction
  
  task trans_data();
    begin
      for(int i=0;i<5;i++)begin
        a++;
        m.put(a);
        $display("trans_data=%0d",a);
      end
    end
  endtask
endclass

class c2;
  int a;
  mailbox m;
  function new(mailbox m2);
    this.m=m2;
  endfunction
  
  task receive_data();
    begin
      for(int i=0;i<2;i++)begin
      m.get(a);
      $display("receive_data=%0d",a);
      end
    end
  endtask
endclass


module unbounded_mailbox;
  c1 m1;
  c2 m2;
  mailbox mb;
  initial begin
    mb=new();
    m1=new(mb);
    m2=new(mb);
    repeat(5)begin
      $display("======================transdata==================");
    m1.trans_data();
    $display("=================================================");
    m2.receive_data();
      $display("=======================receive data==============");
    end    
  end
endmodule 

//output:

// # ======================transdata==================
// # trans_data=1
// # trans_data=2
// # trans_data=3
// # trans_data=4
// # trans_data=5
// # =================================================
// # receive_data=1
// # receive_data=2
// # =======================receive data==============
// # ======================transdata==================
// # trans_data=6
// # trans_data=7
// # trans_data=8
// # trans_data=9
// # trans_data=10
// # =================================================
// # receive_data=3
// # receive_data=4
// # =======================receive data==============
// # ======================transdata==================
// # trans_data=11
// # trans_data=12
// # trans_data=13
// # trans_data=14
// # trans_data=15
// # =================================================
// # receive_data=5
// # receive_data=6
// # =======================receive data==============
// # ======================transdata==================
// # trans_data=16
// # trans_data=17
// # trans_data=18
// # trans_data=19
// # trans_data=20
// # =================================================
// # receive_data=7
// # receive_data=8
// # =======================receive data==============
// # ======================transdata==================
// # trans_data=21
// # trans_data=22
// # trans_data=23
// # trans_data=24
// # trans_data=25
// # =================================================
// # receive_data=9
// # receive_data=10
// # =======================receive data==============
