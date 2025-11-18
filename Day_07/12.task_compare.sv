module task_compare;
  
  task compare(input int a,b,output bit done);
    
    if(a>b)
      $display("a is greater than b");
    if(a<b)
      $display("a is less than b");
    if(a==b)
      $display("a is equal to b");
    
    #10//after 10 time unit done become 1
    done=1;//output signal that tells “task is finished”
  endtask
  
  initial begin
    int a,b;
    bit done;
    #10;compare(10,10,done);   
    if(done)$display("comparison time completed at Time=%0t  done=%0d",$time,done);
    #10;compare(2,10,done);
    if(done)$display("comparison time completed at Time=%0t  done=%0d",$time,done);
    #10;compare(10,2,done);
    if(done)$display("comparison time completed at Time=%0t  done=%0d",$time,done);
  end
endmodule
