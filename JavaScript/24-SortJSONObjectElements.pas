procedure TForm1.WebButton1Click(Sender: TObject);
const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  asm 
    var JS_Object = JSON.parse(SampleObjectData);
    var keys = Object.keys(JS_Object).sort();
    for (var i = 0; i < keys.length; i++) {
     console.log('JS Key: '+keys[i]+' Value: '+JS_Object[keys[i]])
    }
  end;
end;

// console.log output:
// JS Key: apple Value: fruit
// JS Key: banana Value: fruit
// JS Key: carrot Value: vegetable
// JS Key: orange Value: fruit
// JS Key: potato Value: vegetable
