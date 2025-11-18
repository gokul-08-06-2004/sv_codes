module task_premature_return;
  
  task arithemetic(input int a,b ,output byte done);
    
    if(a>b)begin
      #10;done=1;
      return ;
    $display("a is greater than b");
    end
    if(a<b)begin
      #10;done=2;
      return;
      $display("a is less than b");
    end
    if(a==b)begin
      #10;done=3;
      return ;
      $display("a is equal to b");
    end
 
  endtask
  
  initial begin
    int a,b;
    byte done;
    repeat(5)begin
    a=$urandom_range(5,20);
    b=$urandom_range(5,20);
      $display("a=%0d b=%0d",a,b);
      arithemetic(a,b,done);
      if(done==1)
       $display("%0d is greater than %0d time=%0t \n",a,b,$time);
      if(done==2)
       $display("%0d is less than %0d time=%0t \n",a,b,$time);
      if(done==3)
        $display("%0d is equal to %0d time=%0t \n",a,b,$time );
    end
  end
endmodule
