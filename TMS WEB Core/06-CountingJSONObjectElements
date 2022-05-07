procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
 
const 
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  WC_Object := TJSJSON.parseObject(SampleObjectData);
  console.log('WC Object Elements: '+IntToStr(length(TJSObject.keys(WC_Object))));
end;

// console.log output:
// WC Object Elements: 5
