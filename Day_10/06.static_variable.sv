//without static variable
class transaction;
  int count;
  int age;
  
  function f1();
    count++;
    age++;
   // $display("count=%0d age=%0d",count,age);
  endfunction
endclass
  module m1;
    transaction tr[5];
    initial begin
      int i=0;
      repeat(5)begin
        tr[i]=new();
        tr[i].f1();
        $display("count[%0d]=%0d age[%0d]=%0d",i,tr[i].count,i,tr[i].age);
        i=i+1;
      end
    end
  endmodule

// with static varaible
class transaction;
  static int count;
  int id;
  
  function new();
    id=count++;
  endfunction
  
endclass

module m1;
  transaction tr[6];
  initial begin
    for(int i=0; i<6;i++)begin
      tr[i]=new();
      $display("id[%0d]=%0d",tr[i].id,tr[i].count);
    end
    foreach(tr[i])
      $display("id=%0d",tr[i].count);
  
      end
endmodule
