//to access non static variables in static method use static lifetime method:

class transaction;
  
  static int s_count;
  int count;
  
  function static int f1();//static lifetime method
    int sample;
    sample=s_count++;// sample get old value of s_count is 0 
    count++;
    $display("sample=%0d",sample);
  endfunction
endclass

module tb;
  transaction tr[5];
  initial begin
    int i=0;
    repeat(5)begin
      tr[i]=new();
      tr[i].f1();
      $display("s_count[%0d]=%0d count[%0d]=%0d",i,tr[i].s_count,i,tr[i].count);
      i++;
    end
  end
endmodule

//  sample=0
// # s_count[0]=1 count[0]=1
// # sample=1
// # s_count[1]=2 count[1]=1
// # sample=2
// # s_count[2]=3 count[2]=1
// # sample=3
// # s_count[3]=4 count[3]=1
// # sample=4
// # s_count[4]=5 count[4]=1
