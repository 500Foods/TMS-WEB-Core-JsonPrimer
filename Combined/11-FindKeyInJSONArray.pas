procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Array: TJSArray;
  PAS_Array: TJSONArray;
  
const
  SampleArrayData = '[{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"}]';
  
  function WC_FindArrKey(AJSArray: TJSArray; SearchKeyName:String; SearchKey:String):Integer;
  var
    i: integer;
  begin
    Result := -1;
    i := 0;
    while i < AJSArray.Length do
    begin
      if (TJSObject(AJSArray[i])[SearchKeyName] = SearchKey) then
      begin
        Result := i;
        break;
      end;
      i := i + 1;
    end;
  end;
  
  function PAS_FindArrKey(AJSONArray: TJSONArray; SearchKeyName:String; SearchKey:String):Integer;
  var
    i: integer;
  begin
    Result := -1;
    i := 0;
    while i < AJSONArray.Count do
    begin
      if (((AJSONArray[i] as TJSONObject).getValue(SearchKeyName) as TJSONSTring).Value = SearchKey) then
      begin
        Result := i;
        break;
      end;
      i := i + 1;
    end;
  end;
  
begin
  asm var JS_Array = JSON.parse(SampleArrayData); end;
  WC_Array := TJSArray(TJSJSON.parseObject(SampleArrayData));
  PAS_Array := TJSONObject.ParseJSONValue(SampleArrayData) as TJSONArray;
  
  asm
   console.log('JS Array: carrot position = '+JS_Array.findIndex(obj => obj.name == 'carrot'));
   console.log('JS Array: Batman position = '+JS_Array.findIndex(obj => obj.name == 'Batman'));
  end;
  
  console.log('WC Array: carrot position = '+IntToStr(WC_FindArrKey(WC_Array,'name','carrot')));
  console.log('WC Array: Batman position = '+IntToStr(WC_FindArrKey(WC_Array,'name','Batman')));
  
  console.log('PAS Array: carrot position = '+IntToStr(PAS_FindArrKey(PAS_Array,'name','carrot')));
  console.log('PAS Array: Batman position = '+IntToStr(PAS_FindArrKey(PAS_Array,'name','Batman')));
end;

// console.log output:
// JS Array: carrot position = 3
// JS Array: Batman position = -1
// WC Array: carrot position = 3
// WC Array: Batman position = -1
// PAS Array: carrot position = 3
// PAS Array: Batman position = -1
