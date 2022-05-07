procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  PAS_Object: TJSONObject;
 
const 
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
begin
  asm var JS_Object = JSON.parse(SampleObjectData); end;
  WC_Object := TJSJSON.parseObject(SampleObjectData);
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;
  
  asm console.log('JS Object Elements: '+Object.keys(JS_Object).length); end;
  console.log('WC Object Elements: '+IntToStr(length(TJSObject.keys(WC_Object))));
  console.log('PAS Object Elements: '+IntToStr(PAS_Object.count));
end;

// console.log output:
// JS Object Elements: 5
// WC Object Elements: 5
// PAS Object Elements: 5
