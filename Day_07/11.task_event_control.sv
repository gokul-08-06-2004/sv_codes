module task_exaple_with_eventcontrol;
  int clk;
  int a,b;
  task packet(input int a,input  int b);
    
    @(posedge clk)begin
      $display("Time=%0t \t posedge clk",$time);
      a=$urandom;
      b=$urandom;
      $display("Time=%0t \t a=%h  b=%h",$time,a,b);
    end
    
    @(negedge clk)begin
      $display("Time=%0t \t negedge clk",$time);
      a=$urandom;
      b=$urandom;
      $display("Time=%0t \t a=%h b=%h",$time,a,b);
    end
  endtask
  
initial begin
  clk=0; 
  #100;$finish;
end
   always begin
    #10;clk=~clk;
  end
  
  always  begin
    #20;$display("Time=%0t call the task",$time);
    packet(a,b);
  end
 
endmodule
