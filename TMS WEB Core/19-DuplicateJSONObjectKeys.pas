procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  
const
  SampleObjectData = '{"some key":"value 1", "some key":"value 2", "some key":"value 3", "some key":"value 4", "some key":"value 5"}';
  
begin
  WC_Object := TJSJSON.parseObject(SampleObjectData);
  console.log('WC Object = '+TJSJSON.stringify(WC_Object));
end;

// console.log output:
// WC object = {"some key":"value 5"}
