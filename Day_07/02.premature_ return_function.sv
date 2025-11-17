module premature_return_function;
          
        int a;
        int b;
  int result;
  function int compare(input int a,b);
    begin
      if(a>b)begin
        return 1;
        $display("a is greater than b");// after return statement don't retun any statement
    end
      if(a<b)begin
        return 2;
        $display("a is less than b");
      end
      
      if(a==b)begin
        return 3;
        $display("ais equal b");
      end
    end
      endfunction
      initial begin

        
        repeat(5)begin
        a=$urandom_range(5,20);
        b=$urandom_range(5,20);
        
        $display("a=%0d b=%0d",a,b);
          result=compare(a,b);
          if(result==1)
            $display("a is greater than b");
          else if(result ==2)
            $display("a is less than b");
          else if(result ==3)
            $display("a is equal b");
          
        end
      end
      endmodule
