module inside_operator;
  int arr;
  int a;
  int b;
  int c;
  int src[5];
  
   typedef enum{apple,orange,mango}fruit;
   fruit f;
 initial begin
   f=mango;// not in the list
   if(f inside {apple,orange})
     $display("mango inside f");
   else 
     $display("mango is not inside f");
   
   //single value check in the list
   arr=1;
   if(arr inside {0,1,6,7,8})
     begin
       $display("1 is inside the arr");
     end
   else 
     $display("1  is not inside the arr");
   //check in vector
   a=3;b=1;
   if(a inside {[0:3],[4:9]})begin
     b+=1;
   $display("3 is inside in a and b=%0d",b);
   end
   //using wildcard_operator
   c=4'b1010;
   if(c==?4'bx0x0)begin
     b+=1;
     $display("b=%0d",b);
   end
   //using array
   src={1,2,3,4,5};
   if(6 inside {src})// not in the list of array
     $display("5 is inside an src");
     else 
       $display("6 is not inside src");   
 end
endmodule
