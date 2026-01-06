//peek in mailbox;

class c1;
  int a;
  
  mailbox m;
  
  function new(mailbox m1);
    this.m=m1;
  endfunction
  
  task trans_data();
    for(int i=0;i<2;i++)begin
      if(i==2)
        $display("trans_data is full");
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
    for(int i=0;i<3;i++)begin
      m.peek(a);
      $display("copies the data =%0d",a);
    end
    for(int i=0;i<2;i++)begin
    m.get(a);
    $display("recive data=%0d",a);
    end
    $display("mailbox data=%0d",m.num());
  endtask
endclass

module peek_mailbox;
  c1 m1;
  c2 m2;
  mailbox mb;
  initial begin
    mb=new(2);
    m1=new(mb);
    m2=new(mb);
    
    m1.trans_data();
    $display("=============================================");
    m2.receive_data();
    
  end
endmodule 


// # trans_data=1
// # trans_data=2
// # =============================================
// # copies the data =1
// # copies the data =1
// # copies the data =1
// # recive data=1
// # recive data=2
// # mailbox data=0
