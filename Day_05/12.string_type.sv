// Code your testbench here
// or browse Examples
module stirng_datatype;
  string s[5];
  int i1,i2;
  string a,b;
  initial begin
    s[0]="farad";
    s[1]="hellow World";
    s[2]={"dj",s[0]};
    s[3]="anjay";
    s[4]={"",s[3]};   
    foreach(s[i])
      $display("name[%0d]=%s",i,s[i]);
  
    $display("name[1]=%s %0d",s[1].getc(0),s[1].getc(0));
    
    $display("name[4]=%s",s[4]);
    s[0]="123456cc";
    s[1]="ffff0000";
    s[2]="ff00ff00";
    s[3]="bai";
    s[4]="john";
    
    i1=s[0].atoi();//ascii to int
    $display("in=%0d",i1);
    
    s[0].itoa(i1);//int to ascii
    $display("in=%s",s[0]);
    
    i2=s[1].atohex();
    $display("s[1]=%h",i2);
    
    i1=s[3].atoi();
    $display("in =%0d",i1);
    
    a="gokul";
    b="sanjay";
    
    b=a.toupper();
    $display("a[1]=%s",b);
    
    a={a,"3.b"};
    $display("a=%s",a);
    
    a={a.len()-1,"a"};
    $display("a=%s",a);
  end
endmodule
