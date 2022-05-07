procedure TForm1.WebButton1Click(Sender: TObject);  
var  
  // Environment: JavaScript (JS)  
  // Normally we won't need to define these ahead of time  
  // but just in the asm block directly.  
  // JSValue is kind of like a variant - we don't know what it is  
  JS_Object: JSValue;  
  JS_Array:  JSValue;  
    
begin  

  // Environment: JavaScript (JS)  
  asm  
    JS_Object = {};  
    JS_Array = [];  
    console.log('JS Object = '+JSON.stringify(JS_Object));  
    console.log('JS Array = '+JSON.stringify(JS_Array));  
  end;  
      
end;  
    
// console.log output:   
// JS Object = {}  
// JS Array = []  
