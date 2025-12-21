module m1;
  
  semaphore s=new(6);
  
  initial begin
    $display("time=%0t first block start at time",$time);
    s.get(4);
    $display("time=%0t thread 1 use the 4 key of semaphore",$time);
    #5;
    s.put(4);
    $display("time=%0t thread 1 is done e key of semaphore",$time);
  end
  
    initial begin
      $display("time=%0t second block start at time",$time);
      s.get(2);
      $display("time=%0t thread 2 use the 4 key of semaphore",$time);
      #10;
      s.put(2);
      $display("time=%0t thread 2 is done e key of semaphore",$time);
  end
endmodule
