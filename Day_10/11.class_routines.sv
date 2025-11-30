class routines;
  string book_name;
  int pages;
  int no_of_copies;
  
  function new();// constructor
    book_name="digital_electronics";
    pages=304;
    no_of_copies=3;
  endfunction
  function void display();
    $display("book_name=%s \npages=%0d \nno_of_copies=%0d \n",book_name,pages,no_of_copies);
  endfunction
endclass

class detail;
  routines r1;
  function new(routines r2);
    r1=r2;
  endfunction
  
  function void display();
    $display("book_name=%s \npages=%0d \nno_of_copies=%0d ",r1.book_name,r1.pages,r1.no_of_copies);
   
  endfunction
endclass

module m1;
  routines r2;
  detail d1;
  initial begin
    r2=new();
    r2.display();
    
    d1=new(r2);
    r2.book_name="verilog";
    r2.pages=234;
    d1.display();
  end
endmodule

// book_name=digital_electronics 
// # pages=304 
// # no_of_copies=3 
// # 
// # book_name=verilog 
// # pages=234 
// # no_of_copies=3 
