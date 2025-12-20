//event triggering:
module m1;
  event e;
  initial begin
    $display("time=%0t trigggering event",$time);
     ->e;
  end
  
  initial begin
    $display("time=%0t waiting for the event using wait",$time);
    wait(e.triggered);
    $display("time=%0t event is triggered usiing wait",$time);
  end
  
  initial begin
    $display("time=%0t waiting for the event using @",$time);
    @(e.triggered);
    $display("time=%0t event is triggered usiing @",$time);
  end
endmodule
// Why @ cannot detect past events?
// Because:
// @ is edge sensitive
// Edge = change
// Change already finished → nothing to detect
// 💡 @ does NOT look at signal value
// Time 0 : -> ev   (event already triggered)
// Time 5 : @(ev)  (starts waiting)
// 👉 Event is already over
// 👉 @ waits for next trigger
// 👉 Never comes
// wait → Past or present condition OK
    
// # time=0 trigggering event
// # time=0 waiting for the event using wait
// # time=0 event is triggered usiing wait
// # time=0 waiting for the event using @13135550002
