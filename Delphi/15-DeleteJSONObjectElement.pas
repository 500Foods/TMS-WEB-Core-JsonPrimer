procedure TForm1.WebButton1Click(Sender: TObject);
var
  PAS_Object: TJSONObject;
  i: integer;
  tmp_pas_object: TJSONObject;

const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;

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

  console.log('PAS object = '+PAS_Object.ToString);
end;

// console.log output:
// PAS object = {"apple":"fruit","banana":"fruit","orange":"fruit","potato":"vegetable"}
 

