procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  
const
  SampleObjectData = '{"a":"some text","b":12,"c":3.14159,"d":["Delphi","JavaScript"],"e":true,"f":false,"g":null,"h":{"somekey":"somevalue"}}';

  function WC_IdentifyType(Something: TJSObject; Key:String):String;
  var i: integer;
  begin
    Result := 'Unknown';
    if (Something[key] = nil) then
    begin
      if string(Something[Key]) = 'null'
      then Result := 'Null'
      else Result := 'KEY NOT FOUND';
    end
    else
    begin
      if      (Something[Key] = True) then Result := 'True'
      else if (Something[Key] = False) then Result := 'False'
      else if (TJSJSON.stringify(Something[Key]).startsWith('"')) then Result := 'String'
      else if (TJSJSON.stringify(Something[Key]).startsWith('{')) then Result := 'Object'
      else if (TJSJSON.stringify(Something[Key]).startsWith('[')) then Result := 'Array'
      else Result := 'Number';
    end;
  end;
  
begin
  WC_Object := TJSJSON.parseObject(SampleObjectData);
  
  console.log('WC a: '+WC_IdentifyType(WC_Object, 'a'));
  console.log('WC b: '+WC_IdentifyType(WC_Object, 'b'));
  console.log('WC c: '+WC_IdentifyType(WC_Object, 'c'));
  console.log('WC d: '+WC_IdentifyType(WC_Object, 'd'));
  console.log('WC e: '+WC_IdentifyType(WC_Object, 'e'));
  console.log('WC f: '+WC_IdentifyType(WC_Object, 'f'));
  console.log('WC g: '+WC_IdentifyType(WC_Object, 'g'));
  console.log('WC h: '+WC_IdentifyType(WC_Object, 'h'));
  console.log('WC X: '+WC_IdentifyType(WC_Object, 'X'));
end;

// console.log output:
// 
// WC a: String
// WC b: Number
// WC c: Number
// WC d: Array
// WC e: True
// WC f: False
// WC g: Null
// WC h: Object
// WC X: KEY NOT FOUND
