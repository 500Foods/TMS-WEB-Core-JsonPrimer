procedure TForm1.WebButton1Click(Sender: TObject);
const 
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  asm 
    var JS_Object = JSON.parse(SampleObjectData);
    console.log('JS Object Elements: '+Object.keys(JS_Object).length); 
  end;
end;

// console.log output:
JS Object Elements: 5
