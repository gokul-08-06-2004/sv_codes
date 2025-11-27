// static method 
class transaction;
  static int count;
  static int stu;
  
  static function f1();
    count=count+1;
    stu=count;
  endfunction
endclass

module m1;
  transaction tr[5];
  initial begin
    
    for(int i=0;i<5;i++)begin
      tr[i]=new();
      tr[i].f1();
      $display("stu[%0d]=%0d",i,tr[i].count);
    end
  end
endmodule


// static method inside not allow non static propertes it lead an error
class transaction;
  static int count;
  int stu;
  
  static function f1();
    count=count+1;
    stu=count;// Illegal to access non-static property 'stu' from a static method.
  endfunction
endclass

module m1;
  transaction tr[5];
  initial begin
    
    for(int i=0;i<5;i++)begin
      tr[i]=new();
      tr[i].f1();
      $display("stu[%0d]=%0d",i,tr[i].count);
    end
  end
endmodule
