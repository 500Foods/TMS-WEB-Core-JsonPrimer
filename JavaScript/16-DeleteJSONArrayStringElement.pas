procedure TForm1.WebButton1Click(Sender: TObject);
const
  SampleArrayData = '["apple","banana","orange","carrot","potato"]';
  
begin
  asm 
    var JS_Array = JSON.parse(SampleArrayData);
    
    JS_Array.splice(3,1);
    
    console.log('JS Array = '+JSON.stringify(JS_Array)); 
  end;
end;

// console.log output: 
// JS Array = ["apple","banana","orange","potato"]
