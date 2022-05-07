procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  PAS_Object: TJSONObject;
  i: integer;
  WC_Keys: TStringList;
  PAS_Keys: TStringList;
  
const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  asm var JS_Object = JSON.parse(SampleObjectData); end;
  WC_Object := TJSJSON.parseObject(SampleObjectData);
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;
  
  asm
    var keys = Object.keys(JS_Object).sort();
    for (var i = 0; i < keys.length; i++) {
     console.log('JS Key: '+keys[i]+' Value: '+JS_Object[keys[i]])
    }
  end;
  
  // There are other ways to sort but I didn't have much luck here.
  // For example, System.Generics.Collections would hang compiler for some reason
  WC_Keys := TStringList.Create;
  for i := 0 to length(TJSObject.keys(WC_Object))-1 do
    WC_Keys.Add(TJSObject.keys(WC_Object)[i]);
  WC_Keys.sort;
  for i := 0 to WC_Keys.Count -1 do
    console.log('WC Key: '+WC_Keys[i]+' Value: '+string(WC_Object[WC_Keys[i]]));
    
  // Same approach used here for same reason
  PAS_Keys := TStringList.Create;
  for i := 0 to PAS_Object.Count-1 do
    PAS_Keys.Add(PAS_Object.Pairs[i].JSONString.Value);
  PAS_Keys.sort;
  for i := 0 to PAS_Keys.Count -1 do
    console.log('PAS Key: '+PAS_Keys[i]+' Value: '+PAS_Object.Get(PAS_Keys[i]).JSONValue.ToString);
end;

// console.log output:
//
// JS Key: apple Value: fruit
// JS Key: banana Value: fruit
// JS Key: carrot Value: vegetable
// JS Key: orange Value: fruit
// JS Key: potato Value: vegetable
//
// WC Key: apple Value: fruit
// WC Key: banana Value: fruit
// WC Key: carrot Value: vegetable
// WC Key: orange Value: fruit
// WC Key: potato Value: vegetable
//
// PAS Key: apple Value: "fruit"
// PAS Key: banana Value: "fruit"
// PAS Key: carrot Value: "vegetable"
// PAS Key: orange Value: "fruit"
// PAS Key: potato Value: "vegetable"
