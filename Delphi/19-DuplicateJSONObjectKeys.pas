procedure TForm1.WebButton1Click(Sender: TObject);
var
  PAS_Object: TJSONObject;
  
const
  SampleObjectData = '{"some key":"value 1", "some key":"value 2", "some key":"value 3", "some key":"value 4", "some key":"value 5"}';
  
begin
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;
  console.log('PAS Object = '+PAS_Object.ToString);
end;

// console.log output:
// PAS object = {"some key":"value 5"}
