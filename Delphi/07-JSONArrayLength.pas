procedure TForm1.WebButton1Click(Sender: TObject);
var
  PAS_Array: TJSONArray;
  
const
  SampleArrayData = '[{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"}]';
  
begin
  PAS_Array := TJSONObject.ParseJSONValue(SampleArrayData) as TJSONArray;
  console.log('PAS Array Length: '+IntToStr(PAS_Array.Count));
end;

// console.log output:
// PAS Array Length: 5
