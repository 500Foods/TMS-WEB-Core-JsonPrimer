procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Array: TJSArray;
  i: integer;

const
  SampleArrayData = '["apple","banana","orange","carrot","potato"]';

begin
  WC_Array := TJSArray(TJSJSON.parseObject(SampleArrayData));

  WC_Array.splice(3,1);

  console.log('WC Array = '+TJSJSON.stringify(WC_Array));
end;

// console.log output: 
// WC Array = ["apple","banana","orange","potato"]
