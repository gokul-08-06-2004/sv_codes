// Code your testbench here
// or browse Examples
//fork join any

class box;
  
  string name;
  
  task sample(int a,b,c);
    $display("time=%0t main thread process1",$time);
    $display("time=%0t main thread process2",$time);
    //thread 1
    fork
      begin
    if(a==1)begin
      name="process one starting";
      $display("time=%0t",$time,name);
    end
    if(b==1)begin
      #3;
      name="process one finished";
      $display("time=%0t",$time,name);
    end
      end
    //thread 2
   begin
        if(a==1)begin
      name="process second starting";
          $display("time=%0t",$time,name);
    end
     if(b==1)begin
      #1;
      name="process second finished";
      $display("time=%0t",$time,name);
    end
   end
    //thread 3
    begin
        if(a==1)begin
      name="process thrid starting";
          $display("time=%0t",$time,name);
    end
        if(b==1)begin
      #4;
      name="process third finished";
      $display("time=%0t",$time,name);
    end
    end
    join_any
    $display("time=%0t main thread completed1",$time);
    #10;
    $display("time=%0t main thread completed2",$time);
    
  endtask
endclass

module m1;
  box b1;
  initial begin
    b1=new();
    b1.sample(1,1,1);
  end
endmodule

// # time=0 main thread process1
// # time=0 main thread process2
// # time=0process one starting
// # time=0process second starting
// # time=0process thrid starting
// # time=1process second finished
// # time=1 main thread completed1
// # time=3process one finished
// # time=4process third finished
// # time=11 main thread completed2
