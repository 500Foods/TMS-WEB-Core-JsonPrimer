procedure TForm1.WebButton1Click(Sender: TObject);
const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  asm 
    var JS_object = JSON.parse(SampleObjectData); 
    
    JS_object['pineapple'] = 'fruit';
    
    console.log('JS object = '+JSON.stringify(JS_object)); 
  end;
end;

// console.log output:
// JS object = {"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable","pineapple":"fruit"}
