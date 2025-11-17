// Code your testbench here
// or browse Examples
module static_and_automatic_function;
  
  function static int increment_static();
    static int countA;// one fixed memory and keeeps result 1,2,3
    automatic int countB;// automatic_variable create new memory when each call and keeps result 1,1,1
    int countC;// behave static inside static function and keep result 1,2,3
    
    countA++;
    countB++;
    countC++;
    
    $display("countA=%0d countB=%0d countC=%0d",countA,countB,countC);
  endfunction
  
  
  function automatic int increment_automatic();
    static int countA;// one fixed memory and keeeps result 1,2,3
    automatic int countB;//automatic_variable create new memory when each call and keeps result 1,1,1
    int countC;// behave automatic inside automatic function and keep resutl 1,1,1
    
    countA++;
    countB++;
    countC++;
    $display("countA=%0d countB=%0d countC=%0d",countA,countB,countC);
  endfunction
  
  function int increment();// normal function behave like static function
    static int countA;
    automatic int countB;
    int countC;
    
    countA++;
    countB++;
    countC++;
    
    $display("counntA=%0d countB=%0d countC=%0d",countA,countB,countC);
  endfunction
  
  initial begin
    
    $display("---increment_static---");
    increment_static();
    increment_static();
    increment_static();
    $display("---increment_automatic---");
    increment_automatic();
     increment_automatic();
     increment_automatic();
    $display("---increment---");
    increment();
    increment();
    increment();
    
  // Accessing variable using function_name
    //count A
    $display("static_countA is %0d",increment_static.countA);
    $display("automatic_countA is %0d",increment_automatic.countA);
    $display("countA is %0d",increment.countA);
    
    //countB
//     $display("static_countB is %0d",incremnet_static.countB);
//     $display("automatic_countB is %0d",increment_automatic.countB);
//     $dipslay("countB is %0d",increment.countB);
    
    // They appear when you call the function
//They disappear immediately when the function ends
//They do not stay in memory
//Because they disappear, you cannot point to them from outside.
    //so there is no hierarchical reference to access automatic variable,
    
    //countc
    $display("static_countC is %0d",increment_static.countC);
    //$display("automatic_countC is %0d",increment_automatic.countC);// it also not allowed
    $display("countC is %0d",increment.countC);
    
  end
endmodule
