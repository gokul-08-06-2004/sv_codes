module pass_by_value;
  
  task add(input int a,b,output int y);
    
    a=a+b;//in pass by value update value of "a" but not visible outside task
    y=a;
 
  endtask
  
  initial begin
    int a=10;
    int b=10;
    int y;
    add(a,b,y);
    $display("a=%0d b=%0d y=%0d",a,b,y);
  end
endmodule

// default value
module default_value_argument;
  
  task mul(input int a=2,b=3,output int y);
    
    a=a*b;
    y=a;// y is calculated but not visible outside the task
  endtask
  
  initial begin
    int a=2,b=5;// if not pass the value output print default value
    int y;
    mul(a,b,y);
    $display("a=%0d b=%0d y=%0d ",a,b,y);
    
//     for(int i=0;i<5;i++)begin
//       a=i+2;
//       b=i+2;
//       compare(a,b,y);
//       $display("a=%0d b=%0d y=%0d",a,b,y);
//     end
  end
endmodule
