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
  
  asm
    if (JS_Object['carrot']) {console.log('JS Object contains carrot')}
    else {console.log('JS Object does not contain carrot')}
    
    if (JS_Object['Batman']) { console.log('JS Object contains Batman')}
    else {console.log('JS Object does not contain Batman')}
  end;
  
  if WC_Object['carrot'] <> nil
  then console.log('WC Object contains carrot')
  else console.log('WC Object does not contain carrot');
  
  if WC_Object['Batman'] <> nil
  then console.log('WC Object contains Batman')
  else console.log('WC Object does not contain Batman');

  if PAS_Object.getValue('carrot') <> nil
  then console.log('PAS Object contains carrot')
  else console.log('PAS Object does not contain carrot');
  
  if PAS_Object.getValue('Batman') <> nil
  then console.log('PAS Object contains Batman')
  else console.log('PAS Object does not contain Batman');
end;

// console.log output:
// JS Object contains carrot
// JS Object does not contain Batman
// WC Object contains carrot
// WC Object does not contain Batman
// PAS Object contains carrot
// PAS Object does not contain Batman
  
