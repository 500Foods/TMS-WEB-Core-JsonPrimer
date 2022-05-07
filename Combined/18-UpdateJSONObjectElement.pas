procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  PAS_Object: TJSONObject;
  
const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  asm var JS_Object = JSON.parse(SampleObjectData); end;
  WC_Object := TJSJSON.parseObject(SampleObjectData);
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;
  
  asm JS_Object['carrot'] = 'not fruit'; end;
  WC_Object['carrot'] := 'not fruit';
  PAS_Object.AddPair('carrot','not fruit');
  
  asm console.log('JS object = '+JSON.stringify(JS_Object)); end;
  console.log('WC object = '+TJSJSON.stringify(WC_Object));
  console.log('PAS object = '+PAS_Object.ToString);
end;

// console.log output: 
// JS object = {"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"not fruit","potato":"vegetable"}
// WC object = {"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"not fruit","potato":"vegetable"}
// PAS object = {"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"not fruit","potato":"vegetable"}
