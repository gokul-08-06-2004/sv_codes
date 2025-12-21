module m1;
  
  semaphore s =new(6);
  
  initial begin
    
    fork
      begin
        $display("time=%0t first block is entering",$time);
        s.get(4);
        $display("time=%0t thread 1 can take 4 bikes from bike rentel shop",$time);
        #5;
        s.put(2);
        $display("time=%0t thread 1 can return the 4 bikes to bike rental shop",$time);
        #10;
        $display("time=%0t thread 1 say thank you ",$time);
      end
      begin
        $display("time=%0t second block is entering",$time);
        s.get(5);
        $display("time=%0t thread 2 can take 4 bikes from bike rentel shop",$time);
        #5;
        s.put(5);
        $display("time=%0t thread 2 can return the 4 bikes to bike rental shop",$time);
        #10;
        $display("time=%0t thread 2 say thank you ",$time);
      end
    join
  end
endmodule

// # time=0 first block is entering
// # time=0 thread 1 can take 4 bikes from bike rentel shop
// # time=0 second block is entering
// # time=5 thread 1 can return the 4 bikes to bike rental shop
// # time=15 thread 1 say thank you 

module m1;
  
  semaphore s =new(6);
  
  initial begin
    
    fork
      begin
        $display("time=%0t first block is entering",$time);
        s.get(4);
        $display("time=%0t thread 1 can take 4 bikes from bike rentel shop",$time);
        #5;
        s.put(2);
        $display("time=%0t thread 1 can return the 4 bikes to bike rental shop",$time);
        #10;
        $display("time=%0t thread 1 say thank you ",$time);
      end
      begin
        $display("time=%0t second block is entering",$time);
        s.try_get(5);// do not block second block because of try_get is used ,try_get ensure that if key are not unavilable it continues execute.
        $display("time=%0t thread 2 can take 4 bikes from bike rentel shop",$time);
        #5;
        s.put(5);
        $display("time=%0t thread 2 can return the 4 bikes to bike rental shop",$time);
        #10;
        $display("time=%0t thread 2 say thank you ",$time);
      end
    join
  end
endmodule

//void cast

module m1;
  
  semaphore s =new(6);
  
  initial begin
    
    fork
      begin
        $display("time=%0t first block is entering",$time);
        s.get(4);
        $display("time=%0t thread 1 can take 4 bikes from bike rentel shop",$time);
        #5;
        s.put(2);
        $display("time=%0t thread 1 can return the 4 bikes to bike rental shop",$time);
        #10;
        $display("time=%0t thread 1 say thank you ",$time);
      end
      begin
        $display("time=%0t second block is entering",$time);
        void'( s.try_get(5));
        $display("time=%0t thread 2 can take 4 bikes from bike rentel shop",$time);
        #5;
        s.put(5);
        $display("time=%0t thread 2 can return the 4 bikes to bike rental shop",$time);
        #10;
        $display("time=%0t thread 2 say thank you ",$time);
      end
    join
  end
endmodule

// Person B (uses try_get() → non-blocking)
// void'(car_key.try_get(1));

// What happens:

// Person B tries at time = 1

// Car is already with Person A

// try_get(1) fails immediately

// It does NOT wait

// ❗ But your code ignores the return value
// 3️⃣ void'( ... ) — what does this mean?
// void'(expression)
// This is a type cast to void

// It means:
// 👉 “I am intentionally ignoring the return value.”
