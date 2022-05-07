procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Array: TJSArray;
  PAS_Array: TJSONArray;
  i: integer;
  tmparray: TJSONArray;
  
const
  SampleArrayData = '[{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"}]';
  
begin
  asm var JS_Array = JSON.parse(SampleArrayData); end;
  WC_Array := TJSArray(TJSJSON.parseObject(SampleArrayData));
  PAS_Array := TJSONObject.ParseJSONValue(SampleArrayData) as TJSONArray;
  
  asm JS_Array.splice(JS_Array.findIndex(obj => obj.name == 'carrot'),1); end;
  
  i := 0;
  while i < WC_Array.length do
  begin
    if string(TJSObject(WC_Array[i])['name']) = 'carrot' then
    begin
      WC_Array.splice(i,1);
      break;
    end;
    i := i + 1;
  end;
  
  tmparray := TJSONObject.ParseJSONValue('[]') as TJSONArray;
  i := 0;
  while i < PAS_Array.count  do
  begin
    if not(((Pas_Array[i] as TJSONObject).getValue('name') as TJSONString).Value = 'carrot')
    then tmparray.Add(Pas_Array[i] as TJSONObject);
    i := i + 1;
  end;
  PAS_Array := tmpArray;
  
  asm console.log('JS array = '+JSON.stringify(JS_Array)); end;
  console.log('WC array = '+TJSJSON.stringify(WC_Array));
  console.log('PAS array = '+PAS_Array.ToString);
end;

// console.log output:
// JS array = [{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"potato","type":"vegetable"}]
// WC array = [{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"potato","type":"vegetable"}]
// PAS array = [{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"potato","type":"vegetable"}]
 
