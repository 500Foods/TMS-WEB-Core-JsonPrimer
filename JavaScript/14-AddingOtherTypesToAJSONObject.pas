procedure TForm1.WebButton1Click(Sender: TObject);
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

    console.log('JS Object = '+JSON.stringify(JS_Object)); 
  end;
end;

// console.log output:
// JS Object = {"a":"some text","b":12,"c":3.14159,"d":["Delphi","JavaScript"],"e":true,"f":false,"g":null,"h":{"somekey":"somevalue"}}
