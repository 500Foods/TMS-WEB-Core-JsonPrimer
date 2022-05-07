procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  PAS_Object: TJSONObject;
  
begin
  asm
    var JS_Object = {};
    JS_Object['a'] = 'some text';
    JS_Object['b'] = 12;
    JS_Object['c'] = 3.14159;
    JS_Object['d'] = ["Delphi","JavaScript"];
    JS_Object['e'] = true;
    JS_Object['f'] = false;
    JS_Object['g'] = null;
    JS_Object['h'] = {"somekey":"somevalue"};
  end;
  
  WC_Object := TJSObject.new;
  WC_Object['a'] := 'some text';
  WC_Object['b'] := 12;
  WC_Object['c'] := 3.14159;
  WC_Object['d'] := TJSArray(TJSJSON.parseObject('["Delphi","JavaScript"]'));
  WC_Object['e'] := true;
  WC_Object['f'] := false;
  WC_Object['g'] := null;
  WC_Object['h'] := TJSJSON.parseObject('{"somekey":"somevalue"}');
  
  PAS_Object := TJSONObject.Create;
  PAS_Object.AddPair('a','some text');
  PAS_Object.AddPair('b',TJSONNumber.Create(12));
  PAS_Object.AddPair('c',TJSONNumber.Create(3.14159));
  PAS_Object.AddPair('d',TJSONObject.ParseJSONValue('["Delphi","JavaScript"]') as TJSONArray);
  PAS_Object.AddPair('e',TJSONTrue.Create);
  PAS_Object.AddPair('f',TJSONFalse.Create);
  PAS_Object.AddPair('g',TJSONNull.Create);
  PAS_Object.AddPair('h',TJSONObject.ParseJSONValue('{"somekey":"somevalue"}') as TJSONObject);
  
  asm console.log('JS Object = '+JSON.stringify(JS_Object)); end;
  console.log('WC Object = '+TJSJSON.stringify(WC_Object));
  console.log('PAS Object = '+PAS_Object.ToString);
end;

// console.log output:
// JS Object = {"a":"some text","b":12,"c":3.14159,"d":["Delphi","JavaScript"],"e":true,"f":false,"g":null,"h":{"somekey":"somevalue"}}
// WC Object = {"a":"some text","b":12,"c":3.14159,"d":["Delphi","JavaScript"],"e":true,"f":false,"g":null,"h":{"somekey":"somevalue"}}
// PAS Object = {"a":"some text","b":12,"c":3.14159,"d":["Delphi","JavaScript"],"e":true,"f":false,"g":null,"h":{"somekey":"somevalue"}}
