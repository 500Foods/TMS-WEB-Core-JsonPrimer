procedure TForm1.WebButton1Click(Sender: TObject);  
var  
  PAS_Object: TJSONObject;  
  SampleObjectData: WideString;  
  
begin  
  SampleObjectData := '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';  
  
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;  

  console.log('PAS Carrot: '+(PAS_Object.getValue('carrot') as TJSONString).Value);  
end;  
    
// console.log output:  
// PAS Carrot: vegetable    
