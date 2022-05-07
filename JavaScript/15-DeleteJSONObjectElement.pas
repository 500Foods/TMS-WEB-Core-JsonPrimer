procedure TForm1.WebButton1Click(Sender: TObject);
const
  SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';
  
begin
  asm 
    var JS_Object = JSON.parse(SampleObjectData); end;

    // Deceptively simple, but why is it a statement and not a function? Oddly inconsistent.
    delete JS_Object['carrot'];
  
    console.log('JS object = '+JSON.stringify(JS_Object)); 
  end;
end;

// console.log output:
// JS object = {"apple":"fruit","banana":"fruit","orange":"fruit","potato":"vegetable"}
