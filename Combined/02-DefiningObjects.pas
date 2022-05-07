procedure TForm1.WebButton1Click(Sender: TObject);  
var  
  // Environment: JavaScript (JS)  
  // Normally we won't need to define these ahead of time  
  // but just in the asm block directly.  
  // JSValue is kind of like a variant - we don't know what it is  
  JS_Object: JSValue;  
  JS_Array:  JSValue;  
    
  // Environment: TMS WEB Core JavaScript Wrapper (WC)  
  WC_Object: TJSObject;  
  WC_Array: TJSArray;  
      
  // Environment: Delphi (PAS)  
  PAS_Object: TJSONObject;  
  PAS_Array: TJSONArray;  

begin  

  // Environment: JavaScript (JS)  
  asm  
    JS_Object = {};  
    JS_Array = [];  
    console.log('JS Object = '+JSON.stringify(JS_Object));  
    console.log('JS Array = '+JSON.stringify(JS_Array));  
  end;  
      
  // Environment: TMS WEB Core JavaScript Wrapper (WC)  
  WC_Object := TJSObject.new;  
  WC_Array := TJSArray.new;  
  console.log('WC Object = '+TJSJSON.stringify(WC_Object));  
  console.log('WC Array = '+TJSJSON.stringify(WC_Array));  
      
  // Environment: Delphi (PAS)  
  PAS_Object := TJSONObject.Create;  
  PAS_Array := TJSONArray.Create;  
  console.log('PAS Object = '+PAS_Object.ToString);  
  console.log('PAS Array = '+PAS_Array.ToString);  
      
end;  
    
// console.log output:   
// JS Object = {}  
// JS Array = []  
// WC Object = {}  
// WC Array = []  
// PAS Object = {}  
// PAS Array = []  
