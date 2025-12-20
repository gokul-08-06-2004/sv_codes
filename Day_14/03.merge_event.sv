class c1;
  
  event e1;
  event e2;
//   event e1=e2;
  
  task t1();
    fork
    begin
      #5;
      $display("time=%0t triggering the event",$time);
    ->e1;
    end
      begin
        #3;
        $display("time=%0t triggering hte event",$time);
        ->e2;
      end
      begin
        #1;
        $display("time=%0t trigering the event",$time);
        e2=e1;
      end
      begin
        $display("time=%0t triggering is started",$time);
        wait(e1.triggered)
        $display("time=%0t event e1 is done",$time);
      end
      begin
         $display("time=%0t triggering is started",$time);
        wait(e2.triggered)
        $display("time=%0t event e2 is done",$time);
      end
    join
  endtask
endclass

module m1;
  c1 c;
  initial begin
    c=new();
    c.t1();
  end
endmodule
//when e1=e2:
// time=0 triggering is started
// time=0 triggering is started
// time=1 trigering the event
// time=3 triggering hte event
// time=3 event e2 is done
// time=3 event e1 is done
// time=5 triggering the event
  
//when e2=e1;
// time=0 triggering is started
// time=0 triggering is started
// time=1 trigering the event
// time=3 triggering hte event
// time=3 event e2 is done
// time=3 event e1 is done
// time=5 triggering the event
  
    
