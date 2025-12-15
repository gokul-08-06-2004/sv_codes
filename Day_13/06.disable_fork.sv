//without disable fork
module m1;
  
  initial begin
    //fork_join
    $display("time=%0t good morning",$time);
    #5;$display("time=%0t how are you",$time);
    
    fork
      begin
        $display("time=%0t i am good",$time);
        #10;$display("time=%0t much better",$time);
      end
      
      begin
        $display("time=%0t so glourious",$time);
        #20; $display("time=%0t the marvelous",$time);
      end
    join
    $display("---------------------------------------------------");
    //fork_join_any
    
    $display("time=%0t good afternoon",$time);
    #5;$display("time=%0t enter to fork_join_any",$time);
    
    fork
      begin
        $display("time=%0t  process 1 started",$time);
        #10;$display("time=%0t process 1 finished",$time);
      end
      
      begin
        $display("time=%0t process 2 started",$time);
        #20;$display("time=%0t process 2 finished",$time);
      end
    join_any
    
//     $display("-----------------------------------------------------");
    
    $display("time=%0t all time finished ",$time);
    $display("time=%0t all processess terminated",$time);
  end
endmodule

// # time=0 good morning
// # time=5 how are you
// # time=5 i am good
// # time=5 so glourious
// # time=15 much better
// # time=25 the marvelous
// # ---------------------------------------------------
// # time=25 good afternoon
// # time=30 enter to fork_join_any
// # time=30  process 1 started
// # time=30 process 2 started
// # time=40 process 1 finished
// # time=40 all time finished 
// # time=40 all processess terminated
// # time=50 process 2 finished
        


//with disable fork
module m1;
  
  initial begin
    //fork_join
    $display("time=%0t good morning",$time);
    #5;$display("time=%0t how are you",$time);
    
    fork
      begin
        $display("time=%0t i am good",$time);
        #10;$display("time=%0t much better",$time);
      end
      
      begin
        $display("time=%0t so glourious",$time);
        #20; $display("time=%0t the marvelous",$time);
      end
    join
   
    $display("---------------------------------------------------");
    //fork_join_any
    
    $display("time=%0t good afternoon",$time);
    #5;$display("time=%0t enter to fork_join_any",$time);
    
    fork
      
      begin
        $display("time=%0t  process 1 started",$time);
        #10;$display("time=%0t process 1 finished",$time);
      end
      
      begin
        $display("time=%0t process 2 started",$time);
        #20;$display("time=%0t process 2 finished",$time);
      end
    join_any
     disable fork;
       
//     $display("-----------------------------------------------------");
    
    $display("time=%0t all time finished ",$time);
    $display("time=%0t all processess terminated",$time);
  end
endmodule
       
       
// # time=0 good morning
// # time=5 how are you
// # time=5 i am good
// # time=5 so glourious
// # time=15 much better
// # time=25 the marvelous
// # ---------------------------------------------------
// # time=25 good afternoon
// # time=30 enter to fork_join_any
// # time=30  process 1 started
// # time=30 process 2 started
// # time=40 process 1 finished
// # time=40 all time finished 
// # time=40 all processess terminated
