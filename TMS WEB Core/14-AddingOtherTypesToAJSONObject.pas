procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;

begin
  WC_Object := TJSObject.new;
  WC_Object['a'] := 'some text';
  WC_Object['b'] := 12;
  WC_Object['c'] := 3.14159;
  WC_Object['d'] := TJSArray(TJSJSON.parseObject('["Delphi","JavaScript"]'));
  WC_Object['e'] := true;
  WC_Object['f'] := false;
  WC_Object['g'] := null;
  WC_Object['h'] := TJSJSON.parseObject('{"somekey":"somevalue"}');

  console.log('WC Object = '+TJSJSON.stringify(WC_Object));
end;

//console.log output:
WC Object = {"a":"some text","b":12,"c":3.14159,"d":["Delphi","JavaScript"],"e":true,"f":false,"g":null,"h":{"somekey":"somevalue"}}
