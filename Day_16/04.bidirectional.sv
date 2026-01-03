//bidirectional operator:

class bidirectional_operator;
  rand bit[15:0]data;
  rand bit[15:0]addr;
  rand bit[15:0]src;
  
  constraint range{data==addr+src;}
  constraint range1{addr<=20;}
  constraint range2{src<=10;}
  
endclass

module m1;
  bidirectional_operator b1;
  initial begin
    b1=new();
    
    for(int i=0;i<10;i++)begin
      if(b1.randomize())
        $display("data=%0d addr=%0d src=%0d",b1.data,b1.addr,b1.src);
      else
        $display("randomization is failed");
    end
  end
endmodule
