module m1;
  
  initial begin
    $display("time=%0t hi",$time);
    #10; $display("timme=%0t how are you",$time);
    
    //fork join
    fork 
      begin
        $display("time=%0t i am ramu",$time);
        #10; $display("time=%0t i am good",$time);
        #20; $display("time=%0t much better",$time);
      end
      
      begin
        $display("time=%0t i am rakesh",$time);
        #15; $display("time=%0t i am better",$time);
        #30; $display("time=%0t much good",$time);
      end
    join
    
    $display("time=%0t bye",$time);
    #10; $display("time=%0t good bye",$time);
  end
endmodule 


module m1;
  
  initial begin
    $display("time=%0t hi",$time);
    #10; $display("timme=%0t how are you",$time);
    
    //fork join_any
    fork 
      begin
        $display("time=%0t i am ramu",$time);
        #10; $display("time=%0t i am good",$time);
        #20; $display("time=%0t much better",$time);
      end
      
      begin
        $display("time=%0t i am rakesh",$time);
        #15; $display("time=%0t i am better",$time);
        #30; $display("time=%0t much good",$time);
      end
    join_any
    
    $display("time=%0t bye",$time);
    #10; $display("time=%0t good bye",$time);
  end
endmodule    



module m1;
  initial begin
    $display("time=%0t hi",$time);
    #10; $display("timme=%0t how are you",$time);
    
    //fork join_any
    fork 
      begin
        $display("time=%0t i am ramu",$time);
        #10; $display("time=%0t i am good",$time);
        #20; $display("time=%0t much better",$time);
      end
      
      begin
        $display("time=%0t i am rakesh",$time);
        #15; $display("time=%0t i am better",$time);
        #30; $display("time=%0t much good",$time);
      end
    join_any
    wait fork;
    $display("time=%0t bye",$time);
    #10; $display("time=%0t good bye",$time);
  end
endmodule    
      
      
      
//fork join
// # time=0 hi
// # timme=10 how are you
// # time=10 i am ramu
// # time=10 i am rakesh
// # time=20 i am good
// # time=25 i am better
// # time=40 much better
// # time=55 much good
// # time=55 bye
// # time=65 good bye

//fork_join_any
// # time=0 hi
// # timme=10 how are you
// # time=10 i am ramu
// # time=10 i am rakesh
// # time=20 i am good
// # time=25 i am better
// # time=40 much better
// # time=40 bye
// # time=50 good bye
// # time=55 much good

//wait fork
// # time=0 hi
// # timme=10 how are you
// # time=10 i am ramu
// # time=10 i am rakesh
// # time=20 i am good
// # time=25 i am better
// # time=40 much better
// # time=55 much good
// # time=55 bye
// # time=65 good bye
