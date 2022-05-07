procedure TForm1.WebButton1Click(Sender: TObject);
var
  PAS_Object: TJSONObject;

const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';

begin
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;

  PAS_Object.AddPair('carrot','not fruit');

  console.log('PAS object = '+PAS_Object.ToString);
end;

// console.log output: 
// PAS object = {"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"not fruit","potato":"vegetable"}
