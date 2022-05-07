procedure TForm1.WebButton1Click(Sender: TObject);
var
  PAS_Object: TJSONObject;

begin
  PAS_Object := TJSONObject.Create;
  PAS_Object.AddPair('a','some text');
  PAS_Object.AddPair('b',TJSONNumber.Create(12));
  PAS_Object.AddPair('c',TJSONNumber.Create(3.14159));
  PAS_Object.AddPair('d',TJSONObject.ParseJSONValue('["Delphi","JavaScript"]') as TJSONArray);
  PAS_Object.AddPair('e',TJSONTrue.Create);
  PAS_Object.AddPair('f',TJSONFalse.Create);
  PAS_Object.AddPair('g',TJSONNull.Create);
  PAS_Object.AddPair('h',TJSONObject.ParseJSONValue('{"somekey":"somevalue"}') as TJSONObject);

  console.log('PAS Object = '+PAS_Object.ToString);
end;

// console.log output:
PAS Object = {"a":"some text","b":12,"c":3.14159,"d":["Delphi","JavaScript"],"e":true,"f":false,"g":null,"h":{"somekey":"somevalue"}}
