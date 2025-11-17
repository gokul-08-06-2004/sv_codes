module wild_card_operator;
  
  bit [7:0] data;
  bit[7:0] user;
  
  initial begin
    data=8'hff;
    user=8'bxxxx_1xxx;
    if(data==?8'bxxxx1xxx)
      $display("is equal wildcard operator");
    else 
      $display("is not equal wildcard operator");
    
    if(8'bxxxx_xx11!=data)
      $dsiplay("is equal wildcard operator");
    else 
      $display("is not equal wildcard operator");
    
    $display("data=%0d",(data==?8'bxxxx_1xxxx));
    
    // why RHS store in user and  then compare that make false output 
  end
endmodule
