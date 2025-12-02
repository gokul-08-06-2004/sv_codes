class battery;
  int capacity;
  int model;
  bit [3:0]warrenty;
  
  function new(int c,int m,bit [3:0]w);
    capacity=c;
    model=m;
    warrenty=w;
  endfunction
  
  function void display();
    $display("capacity=%0dmah \nmodel=%0d \nwarrenty=%0dyears \n",capacity,model,warrenty);
  endfunction
endclass

class mobile;
  string name;
  battery b;
  
  function new(string s,int c,int m,bit[3:0]w);
    name=s;
    b=new(c,m,w);
  endfunction
  function void display();
    $display("mobile_name=%sx100",name);
    b.display();
  endfunction
endclass

module tb;
  mobile m1,m2;
  initial begin
    m1=new("vivo",6000,2026,2);
    m1.display();
    
    m2=new("poco",5000,2025,1);
    m2.display();
    end
endmodule
