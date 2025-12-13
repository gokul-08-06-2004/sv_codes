module thread_example;

  // Thread 1
  initial begin
    $display("time=%0t Person A: Cooking started",$time);
    #5;
    $display("time=%0t Person A: Cooking finished",$time);
  end

  // Thread 2
  initial begin
    $display("time=%0t Person B: Washing clothes started",$time);
    #3;
    $display("time=%0t Person B: Washing clothes finished",$time);
  end

  // Thread 3
  initial begin
    $display("time=%0t Person C: Reading newspaper started",$time);
    #1;
    $display("time=%0t Person C: Reading newspaper finished",$time);
  end

endmodule

// fork join using scope resolution operator:

class car;
  string name;
  int data;
  
 static task t1();
    fork
    begin
      $display("time=%0t name=%s data=%0d",$time,"aaa",123);
    #5;
      $display("time=%0t name=%s data=%0d",$time,"fff",234);
    end
    
    begin
      $display("time=%0t name=%s data=%0d",$time,"bbb",123);
    #3;
      $display("time=%0t name=%s data=%0d",$time,"eee",234);
    end
    
    begin
      $display("time=%0t name=%s data=%0d",$time,"ccc",123);
    #1;
      $display("time=%0t name=%s data=%0d",$time,"ddd",234);
    end
    join
  endtask
endclass

module m1;
  car m1;
  initial begin
    car::t1();
  end
endmodule

// # time=0 name=aaa data=123
// # time=0 name=bbb data=123
// # time=0 name=ccc data=123
// # time=1 name=ddd data=234
// # time=3 name=eee data=234
// # time=5 name=fff data=234

module person;
  
  initial begin
    $display("time=%0t main thread",$time);
    fork
      //thread 1
    begin
      $display("time=%0t person a",$time);
      #1;
      $display("time=%0t person d",$time);
    end
    //thread 2
    begin
      $display("time=%0t person b",$time);
      #5;
      $display("time=%0t person f",$time);
    end
      //thread 3
      begin
        $display("time=%0t person c",$time);
        #3;
        $display("time=%0t person e",$time);
      end
    join
    $display("time=%0t main thread conitnous",$time);
  end
endmodule
// # time=0 main thread
// # time=0 person a
// # time=0 person b
// # time=0 person c
// # time=1 person d
// # time=3 person e
// # time=5 person f
// # time=5 main thread conitnous
