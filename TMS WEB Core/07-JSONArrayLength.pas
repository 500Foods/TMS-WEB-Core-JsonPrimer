procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Array: TJSArray;

const
  SampleArrayData = '[{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"}]';
  
begin
  WC_Array := TJSArray(TJSJSON.parseObject(SampleArrayData));
  console.log('WC Array Length: '+IntToStr(WC_Array.length));
end;

// console.log output:
WC Array Length: 5
