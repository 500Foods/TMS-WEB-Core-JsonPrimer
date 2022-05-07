procedure TForm1.WebButton1Click(Sender: TObject);
const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';

begin
  asm 
    var JS_Object = JSON.parse(SampleObjectData);
    
    JS_Object['carrot'] = 'not fruit';
    
    console.log('JS object = '+JSON.stringify(JS_Object)); 
  end;
end;

// console.log output: 
// JS object = {"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"not fruit","potato":"vegetable"}
