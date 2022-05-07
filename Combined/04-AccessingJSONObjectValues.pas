procedure TForm1.WebButton1Click(Sender: TObject);  
var  
  WC_Object: TJSObject;  
  PAS_Object: TJSONObject;  
  SampleObjectData: WideString;  
  
begin  
  SampleObjectData := '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';  
  
  asm var JS_Object = JSON.parse(SampleObjectData); end;  
  WC_Object := TJSJSON.parseObject(SampleObjectData);  
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;  

  asm console.log('JS Carrot: '+JS_Object['carrot']); end;  
  console.log('WC Carrot: '+string(WC_Object['carrot']));  
  console.log('PAS Carrot: '+(PAS_Object.getValue('carrot') as TJSONString).Value);  
end;  
    
// console.log output:  
// JS Carrot: vegetable  
// WC Carrot: vegetable  
// PAS Carrot: vegetable    
