procedure TForm1.WebButton1Click(Sender: TObject);  
var  
  WC_Array: TJSArray;  
  PAS_Array: TJSONArray;  
  
const  
  SampleArrayData = '["apple","banana","orange","carrot","potato"]';  
  
  function FindArrString(AJSONArray: TJSONArray; SearchString:String):Integer;  
  var  
    i: integer;  
  begin  
    Result := -1;  
    i := 0;  
    while i < AJSONArray.Count do  
    begin  
      if (AJSONArray[i].Value = SearchString) then  
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
   console.log('JS Array: carrot position = '+JS_Array.indexOf('carrot'));  
   console.log('JS Array: Batman position = '+JS_Array.indexOf('Batman'));  
  end;  
  
  console.log('WC Array: carrot position = '+IntToStr(WC_Array.indexOf('carrot')));  
  console.log('WC Array: Batman position = '+IntToStr(WC_Array.indexOf('Batman')));  
  
  console.log('PAS Array: carrot position = '+IntToStr(FindArrString(PAS_Array,'carrot')));  
  console.log('PAS Array: Batman position = '+IntToStr(FindArrString(PAS_Array,'Batman')));  
end;  

// console.log output:  
// JS Array: carrot position = 3  
// JS Array: Batman position = -1  
// WC Array: carrot position = 3  
// WC Array: Batman position = -1  
// PAS Array: carrot position = 3  
// PAS Array: Batman position = -1  
