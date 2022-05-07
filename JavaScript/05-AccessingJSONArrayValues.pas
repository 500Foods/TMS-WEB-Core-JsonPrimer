procedure TForm1.WebButton1Click(Sender: TObject);
const
  SampleArrayData = '[{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"}]';
  
begin
  asm var JS_Array = JSON.parse(SampleArrayData); end;

  asm console.log('JS Array[3] is: '+JS_Array[3].name+' / '+JS_Array[3].type); end;
end;

// console.log output: 
// JS Array[3] is: carrot / vegetable
  
