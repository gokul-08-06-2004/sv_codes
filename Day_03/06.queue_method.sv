module methods_in_queues;
  integer i;
  int var1[$]='{2,3,4,12,23,34,45,12,34,89};
  int var2[$:10];
  int a,b,c;
  
  initial begin
    
    var2=var1;
    $display("var2=%p,size_var2=%0d",var2,var2.size());
    
    for(i=0;i<$size(var1);i++)begin
      var1[i]=var1[i]+2;
      $display("var[%0d]=%0d",i,var1[i]);
    end
    $display("size_of_var1=%0d",var1.size());// using size() method
    
    var2.insert(3,6);        // insert a number to specific index but not remove any other number
    $display("var2=%p",var2);
    
    var2.pop_front();        //pop_front is used take out the first number
    $display("pop_front=%p",var2);
    a= var2.pop_front();
    $display("pop_front=%0d",a);
    
    var2.pop_back();        //pop_back is used take out the last element
    $display("pop_back=%p",var2);
    b=var2.pop_back();
    $display("pop_back=%0d",b);
    
    var2.push_front(5);    //push_front is used to push the element at beginning and also last element is removed when size is reached
    
    $display("push_front=%p",var2);
    
    var2.push_back(5);    //push_back is used to push the element at last and also first element is removed when size is reached
   $display("push_back=%p",var2);
    
    var2.delete(4);        //delete a specfic index in given queue
    $display("delete_var2[4]=%p",var2);
    
  end
endmodule
