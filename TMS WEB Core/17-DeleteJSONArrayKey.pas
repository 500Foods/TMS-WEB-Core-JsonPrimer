procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Array: TJSArray;
  i: integer;

const
  SampleArrayData = '[{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"}]';
  
begin
  WC_Array := TJSArray(TJSJSON.parseObject(SampleArrayData));

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

  console.log('WC array = '+TJSJSON.stringify(WC_Array));
end;

// console.log output:
// WC array = [{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"potato","type":"vegetable"}]
