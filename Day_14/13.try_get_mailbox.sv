//try_get in mailbox;

class c1;
  int a;
  mailbox m;
  function new(mailbox m1);
    this.m=m1;
  endfunction
  task trans_data();
    for(int i=0;i<3;i++)begin
      a++;
      m.put(a);
      $display("trans_data=%0d",a);
    end
  endtask
endclass

class c2;
  int a;
  mailbox m;
  function new(mailbox m2);
    this.m=m2;
  endfunction
  task recevie_data();
    for(int i=0;i<4;i++)begin
      if(m.try_get(a))
        $display("receive_data=%0d",a);
      else
        $display("recevive data is failed");
    end
  endtask
endclass

module try_get;
  c1 m1;
  c2 m2;
  mailbox mb;
  initial begin
    mb=new(3);
    m1=new(mb);
    m2=new(mb);
    
    repeat(2)begin
    m1.trans_data();
    $display("=========================================");
    m2.recevie_data();
    end
  end
endmodule 

//output:

// # trans_data=1
// # trans_data=2
// # trans_data=3
// # =========================================
// # receive_data=1
// # receive_data=2
// # receive_data=3
// # recevive data is failed
// # trans_data=4
// # trans_data=5
// # trans_data=6
// # =========================================
// # receive_data=4
// # receive_data=5
// # receive_data=6
// # recevive data is failed
