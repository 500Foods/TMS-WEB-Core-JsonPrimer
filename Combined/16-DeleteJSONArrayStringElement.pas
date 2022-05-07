procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Array: TJSArray;
  PAS_Array: TJSONArray;
  i: integer;
  tmp_pas_Array: TJSONArray;
  
const
  SampleArrayData = '["apple","banana","orange","carrot","potato"]';
  
begin
  asm var JS_Array = JSON.parse(SampleArrayData); end;
  WC_Array := TJSArray(TJSJSON.parseObject(SampleArrayData));
  PAS_Array := TJSONObject.ParseJSONValue(SampleArrayData) as TJSONArray;
  
  asm JS_Array.splice(3,1); end;
  
  WC_Array.splice(3,1);
  
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
  
  asm console.log('JS Array = '+JSON.stringify(JS_Array)); end;
  console.log('WC Array = '+TJSJSON.stringify(WC_Array));
  console.log('PAS Array = '+PAS_Array.ToString);
end;

// console.log output: 
// JS Array = ["apple","banana","orange","potato"]
// WC Array = ["apple","banana","orange","potato"]
// PAS Array = ["apple","banana","orange","potato"]
