procedure TForm1.WebButton1Click(Sender: TObject);
var
  PAS_Object: TJSONObject;
  i: Integer;
  
const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;
  
  i := 0;
  while (i < PAS_Object.Count) do
  begin
    console.log('PAS Key: '+PAS_Object.Pairs[i].JSONString.Value+' Value: '+PAS_Object.Pairs[i].JSONValue.Value);
    i := i + 1;
  end;
end;

// console.log output: 
// PAS Key: apple Value: fruit
// PAS Key: banana Value: fruit
// PAS Key: orange Value: fruit
// PAS Key: carrot Value: vegetable
// PAS Key: potato Value: vegetable
