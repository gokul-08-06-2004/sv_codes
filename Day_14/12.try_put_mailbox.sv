// try_put in mailbox;
class c1;
  int a;
  mailbox m;
  function new(mailbox m1);
    this.m=m1;
  endfunction 
  task trans_data();
    for(int i=0;i<4;i++)begin
      a++;
      if(m.try_put(a))
        $display("trans_data=%0d",a);
      else
        $display("trans_data is failed=%0d",a);
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
    for(int i=0;i<3;i++)begin
      m.get(a);
      $display("recevie_data=%0d",a);
    end 
  endtask
endclass


module try_put;
  c1 m1;
  c2 m2;
  mailbox mb;
  initial begin
    mb=new(3);
    m1=new(mb);
    m2=new(mb);
    repeat(2)begin
    m1.trans_data();
    $display("==============================================");
    m2.receive_data();
    end
  end
endmodule


//output:
// # trans_data=1
// # trans_data=2
// # trans_data=3
// # trans_data is failed=4
// # ==============================================
// # recevie_data=1
// # recevie_data=2
// # recevie_data=3
// # trans_data=5
// # trans_data=6
// # trans_data=7
// # trans_data is failed=8
// # ==============================================
// # recevie_data=5
// # recevie_data=6
// # recevie_data=7
