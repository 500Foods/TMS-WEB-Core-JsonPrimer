procedure TForm1.WebButton1Click(Sender: TObject);
var
  PAS_Array: TJSONArray;
  
const
  SampleArrayData = '[{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"}]';

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
  PAS_Array := TJSONObject.ParseJSONValue(SampleArrayData) as TJSONArray;

  console.log('PAS Array: carrot position = '+IntToStr(PAS_FindArrKey(PAS_Array,'name','carrot')));
  console.log('PAS Array: Batman position = '+IntToStr(PAS_FindArrKey(PAS_Array,'name','Batman')));
end;

// console.log output:
// PAS Array: carrot position = 3
// PAS Array: Batman position = -1
  

