procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Array: TJSArray;

const
  SampleArrayData = '[{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"}]';

begin
  WC_Array := TJSArray(TJSJSON.parseObject(SampleArrayData));
  console.log('WC Array[3] is: '+string(TJSObject(WC_Array[3])['name'])+' / '+string(TJSObject(WC_Array[3])['type']));
end;

// console.log output: 
// WC Array[3] is: carrot / vegetable
  
