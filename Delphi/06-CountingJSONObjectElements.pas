procedure TForm1.WebButton1Click(Sender: TObject);
var
  PAS_Object: TJSONObject;
 
const 
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;
  console.log('PAS Object Elements: '+IntToStr(PAS_Object.count));
end;

// console.log output:
PAS Object Elements: 5
