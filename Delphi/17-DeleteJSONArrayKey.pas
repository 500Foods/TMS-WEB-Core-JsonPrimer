procedure TForm1.WebButton1Click(Sender: TObject);
var
  PAS_Array: TJSONArray;
  i: integer;
  tmparray: TJSONArray;
  
const
  SampleArrayData = '[{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"}]';
  
begin
  PAS_Array := TJSONObject.ParseJSONValue(SampleArrayData) as TJSONArray;
  
  tmparray := TJSONObject.ParseJSONValue('[]') as TJSONArray;
  i := 0;
  while i < PAS_Array.count  do
  begin
    if not(((Pas_Array[i] as TJSONObject).getValue('name') as TJSONString).Value = 'carrot')
    then tmparray.Add(Pas_Array[i] as TJSONObject);
    i := i + 1;
  end;
  PAS_Array := tmpArray;
  
  console.log('PAS array = '+PAS_Array.ToString);
end;

// console.log output:
// PAS array = [{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"potato","type":"vegetable"}]
 
