procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  PAS_Object: TJSONObject;
  
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
  asm var JS_Object = JSON.parse(SampleObjectData); end;
  WC_Object := TJSJSON.parseObject(SampleObjectData);
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;
  
  asm
    function JS_IdentifyType(Something, Key) {
      var result = 'Unknown';
      if (Something[Key] === undefined)            {result = 'KEY NOT FOUND'}
      else if (Something[Key] === null)            {result = 'Null'}
      else if (Something[Key] === true)            {result = 'True'}
      else if (Something[Key] === false)           {result = 'False'}
      else if (Array.isArray(Something[Key]))      {result = 'Array'}
      else if (typeof Something[Key] === 'string') {result = 'String'}
      else if (typeof Something[Key] === 'number') {result = 'Number'}
      else if (typeof Something[Key] === 'object') {result = 'Object'}
      return(result);
    }
    console.log('JS a: '+JS_IdentifyType(JS_Object, 'a'));
    console.log('JS b: '+JS_IdentifyType(JS_Object, 'b'));
    console.log('JS c: '+JS_IdentifyType(JS_Object, 'c'));
    console.log('JS d: '+JS_IdentifyType(JS_Object, 'd'));
    console.log('JS e: '+JS_IdentifyType(JS_Object, 'e'));
    console.log('JS f: '+JS_IdentifyType(JS_Object, 'f'));
    console.log('JS g: '+JS_IdentifyType(JS_Object, 'g'));
    console.log('JS h: '+JS_IdentifyType(JS_Object, 'h'));
    console.log('JS X: '+JS_IdentifyType(JS_Object, 'X'));
  end;
  
  console.log('WC a: '+WC_IdentifyType(WC_Object, 'a'));
  console.log('WC b: '+WC_IdentifyType(WC_Object, 'b'));
  console.log('WC c: '+WC_IdentifyType(WC_Object, 'c'));
  console.log('WC d: '+WC_IdentifyType(WC_Object, 'd'));
  console.log('WC e: '+WC_IdentifyType(WC_Object, 'e'));
  console.log('WC f: '+WC_IdentifyType(WC_Object, 'f'));
  console.log('WC g: '+WC_IdentifyType(WC_Object, 'g'));
  console.log('WC h: '+WC_IdentifyType(WC_Object, 'h'));
  console.log('WC X: '+WC_IdentifyType(WC_Object, 'X'));
  
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
// JS a: String
// JS b: Number
// JS c: Number
// JS d: Array
// JS e: True
// JS f: False
// JS g: Null
// JS h: Object
// JS X: KEY NOT FOUND
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
