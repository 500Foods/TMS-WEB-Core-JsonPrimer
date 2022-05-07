procedure TForm1.WebButton1Click(Sender: TObject);  
var  
  JS_Object: JSValue;  
  
const  
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';  
  
begin  
  asm JS_Object = JSON.parse(SampleObjectData); end;  
  
  // WC: Delphi code to access JavaScript JSON Object  
  // Wrapping it in TJSObject() makes it equivalent to a WC TJSObject  
  console.log('WC: '+TJSJSON.stringify(JS_Object));  
  console.log('WC: '+IntToStr(length(TJSObject.keys(TJSObject(JS_Object)))));  
  
  // PAS: Converting to a TJSONObject via Strings works  
  console.log('PAS: '+(TJSONObject.parseJSONValue(TJSJSON.stringify(JS_Object)) as TJSONObject).ToString);  
  console.log('PAS: '+IntToStr((TJSONObject.parseJSONValue(TJSJSON.stringify(JS_Object)) as TJSONObject).Count));  
end;  

// console.log output:  
// WC: {"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}  
// WC: 5  
// PAS: {"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}  
// PAS: 5  
