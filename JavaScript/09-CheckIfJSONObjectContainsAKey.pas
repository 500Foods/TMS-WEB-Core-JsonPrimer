procedure TForm1.WebButton1Click(Sender: TObject);
const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';

begin
  asm var JS_Object = JSON.parse(SampleObjectData); end;
  asm
    if (JS_Object['carrot']) {console.log('JS Object contains carrot')}
    else {console.log('JS Object does not contain carrot')}
    if (JS_Object['Batman']) { console.log('JS Object contains Batman')}
    else {console.log('JS Object does not contain Batman')}
  end;
end;

// console.log output:
// JS Object contains carrot
// JS Object does not contain Batman
