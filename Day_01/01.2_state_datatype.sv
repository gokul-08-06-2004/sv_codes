module two_data_types;
  bit [7:0]a,a1,a2,a3;
  byte b,b1,b2,b3;
  int c,c1,c2,c3;
  shortint d,d1,d2,d3;
  longint e,e1,e2,e3;
  shortreal f;

 
  
  initial begin
    
    a='1;a1=-1;a2=-'1;a3=1;                                
    $display("a=%b,%0d a1=%b,%0d a2=%b,0%d a3=%b,%0d ",a,a,a1,a1,a2,a2,a3,a3);
   b='0;b1=-1;b2=-'1;b3=0;
    $display("b=%b,%0d b1=%b,%0d b2=%b,0%d b3=%b,%0d ",b,b,b1,b1,b2,b2,b3,b3);
    c='1;c1=-1;c2=-'1;c3=0;
    $display("c=%b,%0d c1=%b,%0d c2=%b,0%d c3=%b,%0d ",c,c,c1,c1,c2,c2,c3,c3);
     d='0;d1=-1;d2=-'1;d3=0;
    $display("d=%b,%0d d1=%b,%0d d2=%b,0%d d3=%b,%0d ",d,d,d1,d1,d2,d2,d3,d3);
    e='0;e1=-1;e2=-'1;e3=0;
    $display("e=%b,%0d e1=%b,%0d e2=%b,0%d e3=%b,%0d ",e,e,e1,e1,e2,e2,e3,e3);
     f=-20.40;
    
    $display("f=%f",f);
  end

endmodule