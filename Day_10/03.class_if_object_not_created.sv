// Code your testbench here
// or browse Examples
class simple;
  int a;
  bit b;
  int mul;
  
  function f1(int a,b);
    mul=a*b;
    $display("mul=%0d",mul);
  endfunction
endclass

module m1;
  simple s1,s2;
  initial begin
    s1=new();
    s1.f1(5,6);
    s2.f1(6,4);// object is not created for s2 to overccome this use checking the condition
    
    if(s1!=null)
      s1.f1(5,6);
    else 
      $display("object  is not created");
    
    if(s2!=null)
      s2.f1(6,4);
    else 
      $display("object is not created");
  end
endmodule
