module break_countinue;
  
  int i;
  initial begin
    
    for(i=0;i<11;i++)begin
      if(i==6)
        break;
      $display("i=%0d ",i);
    end
    $display("\n");    
    for(i=0;i<11;i++)begin
      if(i==6)begin
        continue;
      end
      $display("i=%0d",i);
    end
      $display("\n"); 
    i=0;
    repeat(10)begin
     i++;
      if(i==6)begin 
        continue;
      end
       $display("i=%0d",i);
    end
    
    $display("\n"); 
    i=0;
    repeat(10)begin
     if(i==4)begin
        break;
     end
      $display("i=%0d",i);
        i++;
    end
    $display("\n");
    i=0;
    while(i<9)begin
      i++;
      if(i==6)begin
        break;
      end
      $display("i=%0d",i);
    end
        
    
  end
endmodule
