class c1;
  
  int  a;
  mailbox m;
  function new(mailbox m1);
    this.m=m1;
  endfunction
  
  task trans_data();
    for(int i=0;i<=2;i++)begin
      if(m.num()==2)
        $display("mailbox is full");
      else begin
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
    m.get(a);
    $display("data=%0d",a);
  endtask
endclass

module bounded_mailbox;
  c1 m1;
  c2 m2;
  mailbox mb;
  initial begin
    mb=new(2);
    
    m1=new(mb);
    m2=new(mb);
    
    repeat(3)begin
    m1.trans_data();
    $display("===============================================");
    m2.receive_data();
    end
    
  end
endmodule 

//output:
// # trans_data=1
// # trans_data=2
// # mailbox is full
// # ===============================================
// # data=1
// # trans_data=3
// # mailbox is full
// # mailbox is full
// # ===============================================
// # data=2
// # trans_data=4
// # mailbox is full
// # mailbox is full
// # ===============================================
// # data=3
