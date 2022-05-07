procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  PAS_Object: TJSONObject;
  
const
  SampleObjectData = '{"some key":"value 1", "some key":"value 2", "some key":"value 3", "some key":"value 4", "some key":"value 5"}';
  
begin
  asm var JS_Object = JSON.parse(SampleObjectData); end;
  WC_Object := TJSJSON.parseObject(SampleObjectData);
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;
  
  asm console.log('JS Object = '+JSON.stringify(JS_Object)); end;
  console.log('WC Object = '+TJSJSON.stringify(WC_Object));
  console.log('PAS Object = '+PAS_Object.ToString);
end;

// console.log output:
// JS object = {"some key":"value 5"}
// WC object = {"some key":"value 5"}
// PAS object = {"some key":"value 5"}
