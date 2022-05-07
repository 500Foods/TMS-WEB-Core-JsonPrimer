procedure TForm1.WebButton1Click(Sender: TObject);
var
  PAS_Object: TJSONObject;
 
const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;

  if PAS_Object.getValue('carrot') <> nil
  then console.log('PAS Object contains carrot')
  else console.log('PAS Object does not contain carrot');
  if PAS_Object.getValue('Batman') <> nil
  then console.log('PAS Object contains Batman')
  else console.log('PAS Object does not contain Batman');
end;

// console.log output:
// PAS Object contains carrot
// PAS Object does not contain Batman
