module queue_in_array;
  int var1[$];//unbounded
  int var2[$:5];//bounded
  int local_var;
  
  initial begin
    var1='{12,12,2,23,45};
    $display("var_1=%p,var_1=%0d",var1,var1.size());
    
    var2=var1;
    $display("var2=%p,var2=%0d",var2,var2.size());
    
    local_var=var1[2];
    $display("local_var=%0d",local_var);
    
    var1[2]=5;
    $display("var1=%p,var1=%0d",var1,var1.size());
    
    var1={var1,5};
    $display("var1=%p,var1=%0d",var1,var1.size());
    
    var1={5,var1};
    $display("var1=%p,var1=%0d",var1,var1.size());
    
    var1=var1[1:$];
    $display("var1=%p,var1=%0d",var1,var1.size());
    
    var1=var1[0:$-1];
    $display("var1=%p,var1=%0d",var1,var1.size());
    
    var1=var1[1:$-1];
    $display("var1=%p,var1=%0d",var1,var1.size());
    
    var1={};
    $display("var1=%p,var1=%0d",var1,var1.size());
    
    var2={var2[2],10,10,10,10,1};
    $display("var2=%p,var2=%0d",var2,var2.size());
    
    
  end
endmodule
