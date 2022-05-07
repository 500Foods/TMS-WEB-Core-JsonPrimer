procedure TForm1.WebButton1Click(Sender: TObject);
var
  ElapsedTime: TDateTime;
  Count: Integer;
begin
  ElapsedTime := Now;

  // JS Create 1,000,000 Objects
  asm
    var JS_Object = {};
    for (var i = 0; i <= 999999; i++) {
      JS_Object['test '+i] = 'test '+i;
    }
  end;
  console.log('JS Create: '+IntToStr(MillisecondsBetween(Now,ElapsedTime))+' ms');
  ElapsedTime := Now;
  
  // JS Count Objects
  asm
    Count = Object.keys(JS_Object).length;
  end;
  console.log('JS Count: '+IntToStr(MillisecondsBetween(Now,ElapsedTime))+' ms');
  ElapsedTime := Now;
end;

// console.log output: 
// JS Create: 1154 ms
// JS Count: 301 ms
