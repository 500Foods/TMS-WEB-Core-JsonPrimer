procedure TForm1.WebButton1Click(Sender: TObject);
var
  PAS_Array: TJSONArray;
  i: integer;
  tmp_pas_Array: TJSONArray;
  
const
  SampleArrayData = '["apple","banana","orange","carrot","potato"]';
  
begin
  PAS_Array := TJSONObject.ParseJSONValue(SampleArrayData) as TJSONArray;

// No TJSONArray.Remove() ???
  i := 0;
  tmp_PAS_Array := TJSONArray.Create;
  while (i < PAS_Array.Count) do
  begin
    if i <> 3
    then tmp_pas_Array.Add(PAS_Array[i].Value);
    i := i + 1;
  end;
  PAS_Array := tmp_pas_array;
  
  console.log('PAS Array = '+PAS_Array.ToString);
end;

// console.log output: 
PAS Array = ["apple","banana","orange","potato"]
