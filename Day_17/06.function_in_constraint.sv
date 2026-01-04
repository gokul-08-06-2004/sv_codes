//function in constraint;

class function_in_constraint;
  
  rand int data[];
  
  constraint c1{data.size()==10;}
  constraint c2{foreach(data[i])
    data[i]==fact(i+1);}
  
  function  int fact(int num);
    if(num==0)
      fact=1;
    else
      fact=num*fact(num-1);
  endfunction
endclass

module m1;
  function_in_constraint f1;
  initial begin
    f1=new();
    f1.randomize();
    foreach(f1.data[i])
      $display("Pass:data[%0d]=%0d",i,f1.data[i]);
    
  end
endmodule
// # Pass:data[0]=1
// # Pass:data[1]=2
// # Pass:data[2]=6
// # Pass:data[3]=24
// # Pass:data[4]=120
// # Pass:data[5]=720
// # Pass:data[6]=5040
// # Pass:data[7]=40320
// # Pass:data[8]=362880
// # Pass:data[9]=3628800


// Code your design here

class even_number;
  
  rand int num[];
  
  constraint c1{num.size()==10;}
  constraint c2{foreach(num[i])
    num[i]==even(i);}
  
  function int even(int val);
    if(val==0)
      even=0;
    else
      even=val;
  endfunction
endclass

module m1;
  even_number e1;
  int number;
  initial begin
    e1=new();
    e1.randomize();
    foreach(e1.num[i])begin
      number=e1.num[i]%2;
      $display("number=%0d even_number=%0d",e1.num[i],number);
    end
  end
endmodule

// # number=0 even_number=0
// # number=1 even_number=1
// # number=2 even_number=0
// # number=3 even_number=1
// # number=4 even_number=0
// # number=5 even_number=1
// # number=6 even_number=0
// # number=7 even_number=1
// # number=8 even_number=0
// # number=9 even_number=1
