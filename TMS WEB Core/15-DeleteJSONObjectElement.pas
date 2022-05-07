procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  i: integer;
  tmp_wc_object: TJSObject;

const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  WC_Object := TJSJSON.parseObject(SampleObjectData);

  // No delete option in Delphi
  i := 0;
  tmp_wc_object := TJSObject.new;
  while  i < length(TJSObject.keys(WC_Object)) do
  begin
    if not(String(TJSObject.keys(WC_Object)[i]) = 'carrot')
    then tmp_wc_object[String(TJSObject.keys(WC_Object)[i])] := WC_Object[String(TJSObject.keys(WC_Object)[i])];
    i := i + 1;
  end;
  WC_Object := tmp_wc_object;

  console.log('WC object = '+TJSJSON.stringify(WC_Object));
end;

// console.log output:
WC object = {"apple":"fruit","banana":"fruit","orange":"fruit","potato":"vegetable"}
