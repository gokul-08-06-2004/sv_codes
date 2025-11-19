module logical_operator;
  
  logic [3:0]l1,l2;
  int y;
  
  initial begin
    l1=4'b1111;
    l2=4'b1000;
    
    y=l1->l2;
    $display("y=%0d",y);
    
    y=((!l1||l2));
    $display("y=%0d",y);
    
    l1=4'b1111;
    l2=4'b0000;
    y=l1->l2;
    $display("y=%0d",y);
    
    y=(!l1||l2);
    $display("y=%0d",y);
    
    l1=4'b1001;
    l2=4'b1000;
    y=l1<->l2;
    $display("y=%0d",y);
    
    y=(l1->l2)&&(l2->l1);
    $display("y=%0d",y);
    
    
  end
endmodule
