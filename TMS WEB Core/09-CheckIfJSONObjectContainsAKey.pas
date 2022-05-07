procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
 
const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  WC_Object := TJSJSON.parseObject(SampleObjectData);
  
  if WC_Object['carrot'] <> nil
  then console.log('WC Object contains carrot')
  else console.log('WC Object does not contain carrot');
  
  if WC_Object['Batman'] <> nil
  then console.log('WC Object contains Batman')
  else console.log('WC Object does not contain Batman');
end;

// console.log output:
// WC Object contains carrot
// WC Object does not contain Batman
