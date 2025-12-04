//ploymorphism 

class Dogs;
  string name;
  int price;
  string colour;
  int weight;
  //signature means same function name,same arugument,same return type
  virtual function Dog();// polymorphism should virtual and without virtual it do not overrride the parent class method
    name="tomy";
    price=5000;
    colour="white";
    weight=10;
  endfunction
  
  virtual function void display();
    $display("-------Dog information------");
    $display("dog_name=%s \nprice=%0d \ncolour=%s \nweight=%0d \n",name,price,colour,weight);
  endfunction
endclass

class Dogs_1 extends Dogs;
    string tipe;
  function Dog();// polymorphism should virtual 
    name="cimy";
    price=10000;
    colour="Brown";
    weight=20;
    tipe="highbread";
  endfunction
  
  function void display();
 $display("-------Dog information------");
    $display("dog_name=%s \nprice=%0d \ncolour=%s \nweight=%0d \ntype=%s \n",name,price,colour,weight,tipe);
  endfunction
endclass


class Dogs_2 extends Dogs;
    string tipe;
   function Dog();// polymorphism should virtual 
    name="jackey";
    price=50000;
    colour="Black";
    weight=15;
    tipe="normal";
  endfunction
  
 function void display();
  $display("-------Dog information------");
   $display("dog_name=%s \nprice=%0d \ncolour=%s \nweight=%0d \ntype=%s \n",name,price,colour,weight,tipe);
  endfunction
endclass

class Dogs_3 extends Dogs_2;
  int size;
     function Dog();// polymorphism should virtual 
    name="jimmy";
    price=10000;
    colour="white";
    weight=11;
    tipe="husk";
       size=7;
  endfunction
  
 function void display();
  $display("-------Dog information------");
   $display("dog_name=%s \nprice=%0d \ncolour=%s \nweight=%0d \ntype=%s \nsize=%0d \n",name,price,colour,weight,tipe,size);
  endfunction
endclass


module m1;
  Dogs d1;
  Dogs_1 d2=new();
  Dogs_2 d3=new();
  Dogs_3 d4=new();
  
  initial begin
    d1=new();
    d1.Dog();
    d1.display();
    
    d1=d2;//upcasting
    d1.Dog();
    d1.display();//one parent class object handle namecan access the child class in different function ,the parent class function can override by child class method using virtual;
    
    d1=d3;
    d1.Dog();
    d1.display();
    
    d3=d4;//here d3 is parent class and d4 is child class:
    d3.Dog();
    d3.display();
    
  end
endmodule
//     # -------Dog information------
// # dog_name=tomy 
// # price=5000 
// # colour=white 
// # weight=10 
// # 
// # -------Dog information------
// # dog_name=cimy 
// # price=10000 
// # colour=Brown 
// # weight=20 
// # type=highbread 
// # 
// # -------Dog information------
// # dog_name=jackey 
// # price=50000 
// # colour=Black 
// # weight=15 
// # type=normal 
// # 
// # -------Dog information------
// # dog_name=jimmy 
// # price=10000 
// # colour=white 
// # weight=11 
// # type=husk 
// # size=7
