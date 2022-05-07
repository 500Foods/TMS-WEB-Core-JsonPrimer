procedure TForm1.WebButton1Click(Sender: TObject);  
var  
  // Environment: TMS WEB Core JavaScript Wrapper (WC)  
  WC_Object: TJSObject;  
  WC_Array: TJSArray;  
      
begin  

  // Environment: TMS WEB Core JavaScript Wrapper (WC)  
  WC_Object := TJSObject.new;  
  WC_Array := TJSArray.new;  
  console.log('WC Object = '+TJSJSON.stringify(WC_Object));  
  console.log('WC Array = '+TJSJSON.stringify(WC_Array));  
      
end;  
    
// console.log output:   
// WC Object = {}  
// WC Array = []  
