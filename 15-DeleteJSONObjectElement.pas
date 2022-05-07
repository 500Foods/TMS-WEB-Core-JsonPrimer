procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  PAS_Object: TJSONObject;
  i: integer;
  tmp_wc_object: TJSObject;
  tmp_pas_object: TJSONObject;
  
const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  asm var JS_Object = JSON.parse(SampleObjectData); end;
  WC_Object := TJSJSON.parseObject(SampleObjectData);
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;
  
  // Deceptively simple, but why is it a statement and not a function? Oddly inconsistent.
  asm delete JS_Object['carrot']; end;
  
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
  
  // Wherefore Art Thou TJSONObject.RemovePair?
  tmp_pas_object := TJSONObject.Create;
  i := 0;
  while i < PAS_Object.Count do
  begin
    if not(PAS_Object.Pairs[i].toString.startsWith('"carrot":'))
    then tmp_pas_object.AddPair(PAS_Object.Pairs[i]);
    i := i + 1;
  end;
  PAS_Object := tmp_pas_object;
  
  asm console.log('JS object = '+JSON.stringify(JS_Object)); end;
  console.log('WC object = '+TJSJSON.stringify(WC_Object));
  console.log('PAS object = '+PAS_Object.ToString);
end;

// console.log output:
// JS object = {"apple":"fruit","banana":"fruit","orange":"fruit","potato":"vegetable"}
// WC object = {"apple":"fruit","banana":"fruit","orange":"fruit","potato":"vegetable"}
// PAS object = {"apple":"fruit","banana":"fruit","orange":"fruit","potato":"vegetable"}
