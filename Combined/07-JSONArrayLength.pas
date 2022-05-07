procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Array: TJSArray;
  PAS_Array: TJSONArray;
  
const
  SampleArrayData = '[{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"}]';
  
begin
  asm var JS_Array = JSON.parse(SampleArrayData); end;
  WC_Array := TJSArray(TJSJSON.parseObject(SampleArrayData));
  PAS_Array := TJSONObject.ParseJSONValue(SampleArrayData) as TJSONArray;
  
  asm console.log('JS Array Length: '+JS_Array.length); end;
  console.log('WC Array Length: '+IntToStr(WC_Array.length));
  console.log('PAS Array Length: '+IntToStr(PAS_Array.Count));
end;

// console.log output:
// JS Array Length: 5
// WC Array Length: 5
// PAS Array Length: 5
