module pass_by_name;
  
  task mul(input int a,string name);
    #10;
    $display("time=%0t a=%0d name=%s",$time,a,name);
  endtask
  
  initial begin
    int a;
    string name;
    mul(.a(2),.name("gokul"));
    mul(.a(3),.name("hari"));
     end
endmodule
