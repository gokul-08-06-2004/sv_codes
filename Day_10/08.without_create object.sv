//without create an object using scope resolution operator and class handle name

class customer;
  static int count;
  static int age;
  
  static function int f1();
    count++;
    age=age+5;
  endfunction
endclass

module m1;
  customer c1[3];
  initial begin
    $display("using class handle name with out creating object \n");
    foreach(c1[i])begin
      c1[i].f1();
      $display(" count[%0d]=%0d age[%0d]=%0d ",i,c1[i].count,i,c1[i].age);
    end
    $display("socpe the resoultion operator (::) \n");
    foreach(c1[i])begin
      $display("count[%0d]=%0d age[%0d]=%0d",i,customer::count,i,customer::age);
    end
  end
endmodule
