procedure TForm1.WebButton1Click(Sender: TObject);  
var  
  SampleObjectData: WideString;  
  
begin  
  SampleObjectData := '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';  
  
  asm var JS_Object = JSON.parse(SampleObjectData); end;  

  asm console.log('JS Carrot: '+JS_Object['carrot']); end;  
end;  
    
// console.log output:  
// JS Carrot: vegetable  
