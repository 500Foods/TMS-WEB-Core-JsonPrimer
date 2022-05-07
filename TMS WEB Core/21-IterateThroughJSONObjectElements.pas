procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  i: Integer;
  
const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  WC_Object := TJSJSON.parseObject(SampleObjectData);

  i := 0;
  while (i < length(TJSOBject.keys(WC_Object))) do
  begin
    console.log('WC Key: '+string(TJSObject.keys(WC_Object)[i])+' Value: '+string(WC_Object[TJSObject.keys(WC_Object)[i]]));
    i := i + 1;
  end;
end;

// console.log output: 
// WC Key: apple Value: fruit
// WC Key: banana Value: fruit
// WC Key: orange Value: fruit
// WC Key: carrot Value: vegetable
// WC Key: potato Value: vegetable
