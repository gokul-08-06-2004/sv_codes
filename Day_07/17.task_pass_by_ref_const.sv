module pass_by_reference;
  
  task automatic multiply(ref int a,ref int b,output int y);
    a=a+b;//a is updated and dont update global variable of a and b
    y=a;
  endtask
  
  initial begin
    int a=10;
   int b=10;
   int y;
    multiply(a,b,y);
    $display("a=%0d b=%0d y=%0d",a,b,y); //a=20 b=10 y=20 notice a is upadted
  end
endmodule

// const ref

module pass_by_reference_const;
  
  task automatic multiply(const ref int a,const ref int b,output int y);
    //a=a+b; it amy case error use const keyword it donot update any local variable in task
    
    y=a;
  endtask
  
  initial begin
    int a=10;
   int b=10;
   int y;
    multiply(a,b,y);
    $display("a=%0d b=%0d y=%0d",a,b,y);
  end
endmodule
