//normal_task
module normal_task_example;
      //int temp=0;//global variable
  task add(input int a);// localvariable
    static int temp=0;//static local variable new value is added to the previous call
    temp=temp+a;
    $display("temp=%0d",temp);
  endtask
  
  initial begin
    add(1);
    add(2);
    add(3);
  end
endmodule


//automatic_task

module automatic_task_example;
  
  task automatic add(input int a);
    int temp=0;//local variable allow in automatic task it create fresh memory at every time call
    temp=temp+a;
    $display("temp=%0d",temp);
  endtask
  initial begin
    add(1);
    add(2);
    add(3);
  end
endmodule
