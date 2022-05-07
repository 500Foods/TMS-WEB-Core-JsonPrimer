procedure TForm1.WebButton1Click(Sender: TObject);
var
  PAS_Array: TJSONArray;
  i: integer;
  tmparray: TJSONArray;
  
const
  SampleArrayData = '[{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"}]';
  
begin
  PAS_Array := TJSONObject.ParseJSONValue(SampleArrayData) as TJSONArray;

  // #1: Add pineapple to the end of the array
  PAS_Array.Add(TJSONObject.ParseJSONValue('{"name":"pineapple","type":"fruit"}') as TJSONObject);
  
  // #2: add radish to the beginning of the array
  tmparray := TJSONObject.ParseJSONValue('[{"name":"radish","type":"vegetable"}]') as TJSONArray;
  i := 0;
  while i < PAS_Array.count  do
  begin
    tmparray.Add(Pas_Array[i] as TJSONObject);
    i := i + 1;
  end;
  PAS_Array := tmpArray;
  
  // #3: add peach before carrot in the array
  PAS_Array.Add(TJSONObject.ParseJSONValue('{"name":"pineapple","type":"fruit"}') as TJSONObject);
  tmparray := TJSONObject.ParseJSONValue('[]') as TJSONArray;
  i := 0;
  while i < PAS_Array.count  do
  begin
    if (((Pas_Array[i] as TJSONObject).getValue('name') as TJSONString).Value = 'carrot')
    then tmpArray.Add(TJSONObject.ParseJSONValue('{"name":"peach","type":"fruit"}') as TJSONObject);
    tmparray.Add(Pas_Array[i] as TJSONObject);
    i := i + 1;
  end;
  PAS_Array := tmpArray;
  
  console.log('PAS array = '+PAS_Array.ToString);
end;

// console.log output: 
// PAS array = [{"name":"radish","type":"vegetable"},{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"peach","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"},{"name":"pineapple","type":"fruit"}]
