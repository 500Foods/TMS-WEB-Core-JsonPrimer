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
  
  asm console.log('JS Array[3] is: '+JS_Array[3].name+' / '+JS_Array[3].type); end;
  console.log('WC Array[3] is: '+string(TJSObject(WC_Array[3])['name'])+' / '+string(TJSObject(WC_Array[3])['type']));
  console.log('PAS Array[3] is: '+((PAS_Array[3] as TJSONObject).getValue('name') as TJSONString).Value+' / '+((PAS_Array[3] as TJSONObject).getValue('type') as TJSONString).Value);
end;

// console.log output: 
// JS Array[3] is: carrot / vegetable
// WC Array[3] is: carrot / vegetable
// PAS Array[3] is: carrot / vegetable
  
