procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Array: TJSArray;
  
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

begin
  WC_Array := TJSArray(TJSJSON.parseObject(SampleArrayData));

  console.log('WC Array: carrot position = '+IntToStr(WC_FindArrKey(WC_Array,'name','carrot')));
  console.log('WC Array: Batman position = '+IntToStr(WC_FindArrKey(WC_Array,'name','Batman')));
end;

// console.log output:
// WC Array: carrot position = 3
// WC Array: Batman position = -1
