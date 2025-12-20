module m1;
  event e1,e2,e3;
  
   
  initial  begin
    #1;
    $display("time=%0t e1 is waiting",$time);
    ->e1;
  end
  
  initial begin
    #3;
    $display("time=%0t e2 is waiting",$time);
    ->e2;
  end
  
  initial begin
    #5;
    $display("time=%0t e3 is waiting",$time);
    ->e3;
  end
  
  initial begin
    $display("time=%0t triggerring is started",$time);
    wait_order(e1,e2,e3);
    $display("time=%0t e1 and e2 and e3 are triggering",$time);
    else 
      $display("time=%0t nothing is triggering",$time);
  end
endmodule


module m1;
  
  event e1;
  event e2;
  event e3;
  
  initial begin
    fork
      begin
          #6;
    $display($time,"Triggering The Event e3");
    ->e3;
        wait(e3.triggered);
        $display($time,"dnsagneotn");
      end
      begin
         #2;
     $display($time,"Triggering The Event e1");
    ->e1;
      end
      begin
         #8;
    $display($time,"Triggering The Event e2");
    ->e2;
      end
      begin
          $display($time,"\tWaiting for the Event's to trigger");
        wait_order(e1,e3,e2)
     $display($time,"\tEvent's triggered Inorder");
    else 
     $display($time,"\tEvent's triggered Out-Of-Order");
      end
    join
  end
endmodule
// #                    0	Waiting for the Event's to trigger
// #                    2Triggering The Event e1
// #                    6Triggering The Event e3
// #                    6dnsagneotn
// #                    8Triggering The Event e2
// #                    8	Event's triggered Inorder
// # exit
