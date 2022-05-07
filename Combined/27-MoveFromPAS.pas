procedure TForm1.WebButton1Click(Sender: TObject);  
var  
  PAS_Object: TJSONObject;  
  
const  
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';  
  
begin  
  PAS_Object := TJSONObject.parseJSONValue(SampleObjectData) as TJSONObject;  
  
  // JS  
  asm  
    console.log('JS: '+JSON.stringify(PAS_Object['fjv']));  
    console.log('JS: '+Object.keys(PAS_Object['fjv']).length);  
  end;  
  
  // WC  
  console.log('WC: '+TJSJSON.stringify(PAS_Object.JSObject));  
  console.log('WC: '+IntToStr(length(TJSObject.keys(PAS_Object.JSObject))));  
  
end;  

// console.log output:  
// JS: {"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}  
// JS: 5  
// WC: {"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}  
// WC: 5    
