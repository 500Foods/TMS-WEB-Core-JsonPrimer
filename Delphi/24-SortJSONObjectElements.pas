procedure TForm1.WebButton1Click(Sender: TObject);
var
  PAS_Object: TJSONObject;
  i: integer;
  PAS_Keys: TStringList;
  
const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;

  // There are other ways to sort but I didn't have much luck here.
  // For example, System.Generics.Collections would hang compiler for some reason
  // Same approach used here for same reason
  PAS_Keys := TStringList.Create;
  for i := 0 to PAS_Object.Count-1 do
    PAS_Keys.Add(PAS_Object.Pairs[i].JSONString.Value);
  PAS_Keys.sort;
  for i := 0 to PAS_Keys.Count -1 do
    console.log('PAS Key: '+PAS_Keys[i]+' Value: '+PAS_Object.Get(PAS_Keys[i]).JSONValue.ToString);
end;

// console.log output:
// PAS Key: apple Value: "fruit"
// PAS Key: banana Value: "fruit"
// PAS Key: carrot Value: "vegetable"
// PAS Key: orange Value: "fruit"
// PAS Key: potato Value: "vegetable"
