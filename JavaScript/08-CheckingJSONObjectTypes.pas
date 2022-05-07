procedure TForm1.WebButton1Click(Sender: TObject);
const
  SampleObjectData = '{"a":"some text","b":12,"c":3.14159,"d":["Delphi","JavaScript"],"e":true,"f":false,"g":null,"h":{"somekey":"somevalue"}}';

begin
  asm var JS_Object = JSON.parse(SampleObjectData); end;
  
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
