//access static properties and static methods from outide the class usiing scope resolution without creating object:

class emp_salary;
  static string name="zzzzz";
  static int salary;
  static int addr;
  static int data;
  
  static function f1(int s=200000,int a);
    salary=s;
    addr=a;
    data=20;
    $display("name=%s \nsalary=%0d \naddr=%0d \ndata=%0d",name,salary,addr,data);
  endfunction
endclass

module m1;
  emp_salary e1;
  initial begin
    emp_salary::f1(.a(20));
  end
endmodule
// # name=zzzzz 
// # salary=200000 
// # addr=20 
// # data=20
// ✅ **RULE: Once you give a default value to one argument,
// ➡️ all arguments AFTER it must also have defaults.**
// This rule is universal.
//argument syntax is wrong or use instatation in fucntion call like emp_salary::f1(.a(20))
// so become simulator errors.
// Because s has a default value, but a does NOT.
// So this is illegal in SV.
// ✔ Either give default to both
// ✔ Or remove default from the first



//access without static properties and static methods from outide the class usiing scope resolution without creating object:

class emp_salary;
   string name="zzzzz";
   int salary;
   int addr;
   int data;
  
 function f1(int s=200000,int a);
    salary=s;
    addr=a;
    data=20;
    $display("name=%s \nsalary=%0d \naddr=%0d \ndata=%0d",name,salary,addr,data);
  endfunction
endclass

module m1;
  emp_salary e1;
  initial begin
    emp_salary::f1(.a(20));
  end
endmodule
 
 Illegal to access non-static method 'f1' outside its class scope;
to overcome this use to create object and aceess the function using handle name


class emp_salary;
   string name="zzzzz";
   int salary;
   int addr;
   int data;
  
 function f1(int s=200000,int a);
    salary=s;
    addr=a;
    data=20;
    $display("name=%s \nsalary=%0d \naddr=%0d \ndata=%0d",name,salary,addr,data);
  endfunction
endclass

module m1;
  emp_salary e1;
  initial begin
    e1=new(); 
    e1.f1(.a(20));
  end
endmodule
// # name=zzzzz 
// # salary=200000 
// # addr=20 
// # data=20


//using enum named constant access outside the class or module:

class bike;
  
  typedef enum{r15,ktm,pulsar,kawasaki}brand;
  brand br[4];
  
//   function f1();
//     for (int i=0;i<4;i++)begin
//       br[i]=i;
//       $display("br[%0d]=%s numeric(%0d)",i,br[i].name(),br[i]);
//     end
//   endfunction
endclass

class bike_1 extends bike;
  function f1();
  for(int i=0;i<4;i++)begin
    bike::br[i].name();
    br[i]=i;
    $display("br[%0d]=%s numeric(%0d)",i,br[i].name(),br[i]);
  end
endfunction
endclass

module m1;
  bike_1 b1;
  initial begin
    b1=new();
    b1.f1();
  end
endmodule
      
// # br[0]=r15 numeric(0)
// # br[1]=ktm numeric(1)
// # br[2]=pulsar numeric(2)
// # br[3]=kawasaki numeric(3)
