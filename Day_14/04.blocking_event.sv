// Code your testbench here
// or browse Examples
module m1;
  event e1;
  initial begin
    $display("time=%0t event e1 triggered",$time);
    ->e1;
  end
  
  initial begin
    $display("time=%0t event e1 wait for the event and triggering for the event",$time);
    wait(e1.triggered);
    $display("time=%0t event e1 is done",$time);
  end
  
  initial begin
    $display("time=%0t event e1 @ for the event and triggering for the event",$time);
    @(e1.triggered);
    $display("time=%0t event e1 is done",$time);
  end
endmodule

// # time=0 event e1 triggered
// # time=0 event e1 wait for the event and triggering for the event
// # time=0 event e1 is done
// # time=0 event e1 @ for the event and triggering for the event
