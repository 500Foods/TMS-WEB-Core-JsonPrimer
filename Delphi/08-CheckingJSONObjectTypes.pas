procedure TForm1.WebButton1Click(Sender: TObject);
var
  PAS_Object: TJSONObject;
  
const
  SampleObjectData = '{"a":"some text","b":12,"c":3.14159,"d":["Delphi","JavaScript"],"e":true,"f":false,"g":null,"h":{"somekey":"somevalue"}}';
  
  function PAS_IdentifyType(Something: TJSONObject; Key:String):String;
  var i: integer;
  begin
    Result := 'Unknown';
    if not(Something.get(Key) is TJSONPair) then
    begin
      i := 0;
      Result := 'KEY NOT FOUND';
      while (i <  Something.Count) do
      begin
        if Something.Pairs[i].ToString.StartsWith('"'+Key+'":') then
        begin
          Result := 'Null';
          break;
        end;
        i := i +1;
      end;
    end
    else
    begin
      Result := Copy(Something.get(Key).JSONValue.ClassName, 6, MaxInt);
    end;
  end;
  
begin
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;
  
  console.log('PAS a: '+PAS_IdentifyType(PAS_Object, 'a'));
  console.log('PAS b: '+PAS_IdentifyType(PAS_Object, 'b'));
  console.log('PAS c: '+PAS_IdentifyType(PAS_Object, 'c'));
  console.log('PAS d: '+PAS_IdentifyType(PAS_Object, 'd'));
  console.log('PAS e: '+PAS_IdentifyType(PAS_Object, 'e'));
  console.log('PAS f: '+PAS_IdentifyType(PAS_Object, 'f'));
  console.log('PAS g: '+PAS_IdentifyType(PAS_Object, 'g'));
  console.log('PAS h: '+PAS_IdentifyType(PAS_Object, 'h'));
  console.log('PAS X: '+PAS_IdentifyType(PAS_Object, 'X'));
end;

// console.log output:
// 
// PAS a: String
// PAS b: Number
// PAS c: Number
// PAS d: Array
// PAS e: True
// PAS f: False
// PAS g: Null
// PAS h: Object
// PAS X: KEY NOT FOUND
