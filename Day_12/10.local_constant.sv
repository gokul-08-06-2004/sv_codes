instance constant variable

class area;
  const string user;
  const int width;
  const int depth;
  const int area_of_rectangle;
  
  function new();
    user="sam";
    width=2;
    depth=3;
    area_of_rectangle=width*depth;
  endfunction
  function void display();
    $display("user=%s \nwidth=%0d \ndepth=%0d \narea_of_rectangle=%0d",user,width,depth,area_of_rectangle);
  endfunction
endclass

module m1;
  area a1;
  initial begin
    a1=new();
    a1.display();
  end
endmodule

// output:
// # user=sam 
// # width=2 
// # depth=3 
// # area_of_rectangle=6

// IN instance variable not allow static because object is created must so it is non static 


class area;
  static const string user;
  static const int width;
  static const int depth;
  static const int area_of_rectangle;
  
  function new();
    user="sam";
    width=2;
    depth=3;
    area_of_rectangle=width*depth;
  endfunction
  function void display();
    $display("user=%s \nwidth=%0d \ndepth=%0d \narea_of_rectangle=%0d",user,width,depth,area_of_rectangle);
  endfunction
endclass

module m1;
  area a1;
  initial begin
    a1=new();
    a1.display();
  end
endmodule //static is not allow in instance constant it lead to compile error.


class area;
  const string user;
  const int width;
  const int depth;
  const int area_of_rectangle;
  
  function new();
    user="sam";
    width=2;
    depth=3;
    area_of_rectangle=width*depth;
  endfunction
  function void display();
    $display("user=%s \nwidth=%0d \ndepth=%0d \narea_of_rectangle=%0d",user,width,depth,area_of_rectangle);
  endfunction
endclass

module m1;
  area a1;
  initial begin
    a1=new();
    a1.user="zzzz";
    a1.display();
  end
endmodule

//thorough error because instance constant assign only inside constructor
