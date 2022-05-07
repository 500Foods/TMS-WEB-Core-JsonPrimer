procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  
const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  WC_Object := TJSJSON.parseObject(SampleObjectData);
 
  WC_Object['pineapple'] := 'fruit';
  
  console.log('WC object = '+TJSJSON.stringify(WC_Object));
end;

// console.log output:
// WC object = {"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable","pineapple":"fruit"}
