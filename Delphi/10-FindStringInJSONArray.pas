procedure TForm1.WebButton1Click(Sender: TObject);  
var  
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
  PAS_Array := TJSONObject.ParseJSONValue(SampleArrayData) as TJSONArray;  
  
  console.log('PAS Array: carrot position = '+IntToStr(FindArrString(PAS_Array,'carrot')));  
  console.log('PAS Array: Batman position = '+IntToStr(FindArrString(PAS_Array,'Batman')));  
end;  

// console.log output:  
// PAS Array: carrot position = 3  
// PAS Array: Batman position = -1  
