// Code your design here
module fork_join;
  initial begin
    
    //fork_join
    $display($time," Starts fork....join");
  #10;
    $display($time," Sequential after #10");

  fork
    $display($time," plan A");
    #50
    $display($time," plan A finished #50");
    #10
    $display($time," plan A exist at  #10");
    
    begin
      #30
      $display($time," Bomb squad #30");
      #10
      $display($time," horse sqaud #10");
    end
  join
    $display($time," After join plan B");
  #80
    $display($time," final after #80 \n");
    $display("-------------------------------------------------");
    $display($time," Starts fork....join_any");
  #10
    $display($time," Sequential after #10");
   
    
    //fork...join_any
  fork
    $display($time," plan B");
    #50
    $display($time," Parallel #50");
    #10
    $display($time," plan B started #10");
    
    begin
      #30
      $display($time," plan B atom squad #30");
      #10
      $display($time," plan B weapon squad #10");
    end
  join_any
    $display($time," After join_any");
  #80
    $display($time," final after #80 \n");
    $display("-------------------------------------------------");
    $display($time," Starts fork....join_none ");
  #10
    $display($time," Sequential after #10");
  
    
    //fork_join_none
  fork
    $display($time," Plan c ");
    #50
    $display($time," plan finished #50");
    #10
    $display($time," Plan C started #10");
    
    begin
      #30
      $display($time," plan c backup squad #30");
      #10
      $display($time," plan c support squad #10");
    end
  join_none
    $display($time," After join_none");
  #80
    $display($time," final after #80");
  end
endmodule
