module packed_structure;
  struct packed{
    bit [7:0]intr;
    logic [23:0]addr;
  }num;
  
  initial begin
    num.intr='hff;
    $display("intr=%h",num.intr);
    
    num='h00ff00ff;
    $display("addr=%h",num);
    
    num=0;
    num=num+'h12;
    $display("addr=%h",num);
  end
endmodule

module unpacked_structure;
  typedef struct {
    int addr='haaffaaff;
  bit [7:0]src[4]='{1,2,3,4};
  logic [7:0]srt='h12;
  }num;
  num n1,n2;
  
  initial begin
    $display("\n addr=%h \n src=%p \n srt=%0d",n1.addr,n1.src,n1.srt);
    
    n2.addr='haaaa_aaaa;
    n2.src='{4,3,2,1};
    n2.srt='h23;
    
    $display("\n addr=%h \n src=%p \n srt=%0d",n2.addr,n2.src,n2.srt);
  end
endmodule
