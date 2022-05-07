procedure TForm1.WebButton1Click(Sender: TObject);  
var  
  WC_Object: TJSObject;  
  SampleObjectData: WideString;  
  
begin  
  SampleObjectData := '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';  
  
  WC_Object := TJSJSON.parseObject(SampleObjectData);  

  console.log('WC Carrot: '+string(WC_Object['carrot']));  
end;  
    
// console.log output:  
// WC Carrot: vegetable  
