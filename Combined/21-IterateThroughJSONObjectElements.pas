procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  PAS_Object: TJSONObject;
  i: Integer;
  
const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  asm var JS_Object = JSON.parse(SampleObjectData); end;
  WC_Object := TJSJSON.parseObject(SampleObjectData);
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;
  
  asm
    for (var Key in JS_Object) {
      console.log('JS Key: '+Key+' Value: '+JS_Object[Key])
    }
  end;
  
  i := 0;
  while (i < length(TJSOBject.keys(WC_Object))) do
  begin
    console.log('WC Key: '+string(TJSObject.keys(WC_Object)[i])+' Value: '+string(WC_Object[TJSObject.keys(WC_Object)[i]]));
    i := i + 1;
  end;
  
  i := 0;
  while (i < PAS_Object.Count) do
  begin
    console.log('PAS Key: '+PAS_Object.Pairs[i].JSONString.Value+' Value: '+PAS_Object.Pairs[i].JSONValue.Value);
    i := i + 1;
  end;
end;

// console.log output: 
//
// JS Key: apple Value: fruit
// JS Key: banana Value: fruit
// JS Key: orange Value: fruit
// JS Key: carrot Value: vegetable
// JS Key: potato Value: vegetable
//
// WC Key: apple Value: fruit
// WC Key: banana Value: fruit
// WC Key: orange Value: fruit
// WC Key: carrot Value: vegetable
// WC Key: potato Value: vegetable
//
// PAS Key: apple Value: fruit
// PAS Key: banana Value: fruit
// PAS Key: orange Value: fruit
// PAS Key: carrot Value: vegetable
// PAS Key: potato Value: vegetable
