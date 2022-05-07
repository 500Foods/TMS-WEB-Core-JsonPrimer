procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  i: integer;
  WC_Keys: TStringList;
  
const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  WC_Object := TJSJSON.parseObject(SampleObjectData);
  // There are other ways to sort but I didn't have much luck here.
  // For example, System.Generics.Collections would hang compiler for some reason
  WC_Keys := TStringList.Create;
  for i := 0 to length(TJSObject.keys(WC_Object))-1 do
    WC_Keys.Add(TJSObject.keys(WC_Object)[i]);
  WC_Keys.sort;
  for i := 0 to WC_Keys.Count -1 do
    console.log('WC Key: '+WC_Keys[i]+' Value: '+string(WC_Object[WC_Keys[i]]));
end;

// console.log output:
// WC Key: apple Value: fruit
// WC Key: banana Value: fruit
// WC Key: carrot Value: vegetable
// WC Key: orange Value: fruit
// WC Key: potato Value: vegetable
