procedure TForm1.WebButton1Click(Sender: TObject);
const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  asm 
    var JS_Object = JSON.parse(SampleObjectData);
    for (var Key in JS_Object) {
      console.log('JS Key: '+Key+' Value: '+JS_Object[Key])
    }
  end;
end;

// console.log output: 
// JS Key: apple Value: fruit
// JS Key: banana Value: fruit
// JS Key: orange Value: fruit
// JS Key: carrot Value: vegetable
// JS Key: potato Value: vegetable
