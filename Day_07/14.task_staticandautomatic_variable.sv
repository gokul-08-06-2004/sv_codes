module static_automatic_variable;
  
  task static increment_static();
    static int countA;
    automatic int countB;
    int countC;
    
    countA++;
    countB++;
    countC++;
    $display("countA=%0d countB=%0d countC=%0d",countA,countB,countC);
  endtask
  
  task automatic increment_automatic();
    static int countA;
    automatic int countB;
    int countC;
    
    countA++;
    countB++;
    countC++;
    $display("countA=%0d countB=%0d countC=%0d",countA,countB,countC);
  endtask
  
  task increment();
    static int countA;
    automatic int countB;
    int countC;
    
    countA++;
    countB++;
    countC++;
    $display("countA=%0d countB=%0d countC=%0d",countA,countB,countC);
  endtask
  
  initial begin
    
    $display("----increment_static----");
    increment_static();
    increment_static();
    increment_static();
    
    $display("----automatic_static----");
    increment_automatic();
     increment_automatic();
     increment_automatic();
    
    $display("----normal_task----");
    increment();
     increment();
     increment();
    
    
    $display("countA");
    $display("counA in increment_static is %0d",increment_static.countA);
    $display("countA in incremnet_automatic is %0d",increment_automatic.countA);
    $display("countA in normal_task is %0d",increment.countA);
//     $display("countB");
//     $display("countB in increment_static is %0d",increment_static.countB);
//     $display("countB in incremnet_automatic is %0d",increment_automatic.countB);
//     $display("countB in normal_task is %0d",increment.countB);
    $display("countC");
    $display("countC in increment_static is %0d",increment_static.countC);
//     $display("countC in incremnet_automatic is %0d",increment_automatic.countC);
    $display("countC in normal_task is %0d",increment.countC);
    
    
  end
endmodule
