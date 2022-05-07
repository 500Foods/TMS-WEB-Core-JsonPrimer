procedure TForm1.WebButton1Click(Sender: TObject);
const
  SampleObjectData = '{"some key":"value 1", "some key":"value 2", "some key":"value 3", "some key":"value 4", "some key":"value 5"}';
  
begin
  asm 
    var JS_Object = JSON.parse(SampleObjectData);
    console.log('JS Object = '+JSON.stringify(JS_Object)); 
  end;
end;

// console.log output:
// JS object = {"some key":"value 5"}
