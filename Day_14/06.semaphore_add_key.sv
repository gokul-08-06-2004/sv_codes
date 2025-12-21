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
      s.get(3);
      $display("time=%0t thread 2 use the 4 key of semaphore",$time);
      #10;
      s.put(2);
      $display("time=%0t thread 2 is done e key of semaphore",$time);
  end
endmodule


module m1;
  
  semaphore s=new(6);
  
  initial begin
    $display("time=%0t first block start at time",$time);
    s.get(4); //Take 4 keys from semaphore
    $display("time=%0t thread 1 use the 4 key of semaphore",$time);
    #5;
    s.put(2);//Put back 2 keys into semaphore
    $display("time=%0t thread 1 is done e key of semaphore",$time);
  end
  
    initial begin
      $display("time=%0t second block start at time",$time);
      s.get(5);//Take 5 keys from semaphore, blocks if not available
      $display("time=%0t thread 2 use the 4 key of semaphore",$time);
      #10;
      s.put(2);// Put back 5 keys into semaphore
      $display("time=%0t thread 2 is done e key of semaphore",$time);
  end
endmodule

// # time=0 first block start at time
// # time=0 thread 1 use the 4 key of semaphore
// # time=0 second block start at time
// # time=5 thread 1 is done e key of semaphore

//explaination:
// semaphore s = new(6);
// Semaphore starts with 6 keys

// Time = 0 → available keys = 6

// Thread 1 (first initial block)

// s.get(4);
// Thread 1 requests 4 keys

// 6 keys available → granted

// Remaining keys = 6 − 4 = 2

// Thread 1 holds the keys for 5 time units.

// Thread 2 (second initial block)

// s.get(3);
// Thread 2 requests 3 keys

// Only 2 keys available

// ❌ Not enough keys

// 👉 Thread 2 BLOCKS (waits) until keys are returned

// This is the key learning point.

// Time = 5 (Thread 1 releases keys)
// systemverilog
// Copy code
// s.put(4);
// Thread 1 returns 4 keys

// Available keys = 2 + 4 = 6

// Thread 2 was waiting → now it can proceed.

// Thread 2 resumes
// Thread 2 successfully gets 3 keys

// Available keys = 6 − 3 = 3

// Thread 2 runs for 10 time units

// ❌ Problem: Incorrect key return
// systemverilog
// Copy code
// s.put(2);
// Thread 2 took 3 keys

// But returns only 2 keys

// Available keys = 3 + 2 = 5

// ⚠️ One key is lost forever

// Final semaphore state (BUG)
// Initial keys = 6

// Final keys = 5 ❌

// This breaks the semaphore’s correctness.
