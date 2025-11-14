module enum_type;
  integer i;
  typedef enum logic[7:0]{red,yellow,green}traffic;
  
  traffic light,d;//[3];
  
  initial begin 
//     for(i=0;i<3;i++)begin
    //       light[i]=traffic'(i%3);// type casting
//       $display("light[%0d]=%s (numeric=%0d)",i,light[i].name(),light[i]);
    //     end
    light=light.first();
    $display("light=%s (numeric=%0d)",light.name(),light);
    
    light=light.next();
    $display("light=%s (numeric=%0d)",light.name(),light);
    
    light=light.prev();
    $display("light=%s (numeric=%0d)",light.name(),light);
    
    light=light.last();
    $display("light=%s (numeric=%0d)\n",light.name(),light);
  
       $display("light=%s",light.name());
    
    d=light;
    $display("d=%s",d.name());
    
    i=d;
    $display("i=%0d",i);
    
    d=traffic'(i-1);//typecasting
    $display("d=%s (numeric=%0d)",d.name(),d);
  
  end
endmodule
