procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  PAS_Object: TJSONObject;
  ElapsedTime: TDateTime;
  i: Integer;
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
  
  // WC Create 1,000,000 Objects
  WC_Object := TJSObject.new;
  for i := 0 to 999999 do
    WC_Object['test '+IntToStr(i)] := 'test '+IntToStr(i);
  console.log('WC Create: '+IntToStr(MillisecondsBetween(Now,ElapsedTime))+' ms');
  ElapsedTime := Now;
  
  // WC Count Objects
  Count := length(TJSObject.keys(WC_Object));
  console.log('WC Count: '+IntToStr(MillisecondsBetween(Now,ElapsedTime))+' ms');
  ElapsedTime := Now;
  
  // PAS Create 10,000 Objects
  PAS_Object := TJSONObject.Create;
  for i := 0 to 9999 do
    PAS_Object.AddPair('test '+IntToStr(i),'test '+IntToStr(i));
  console.log('PAS Create: '+IntToStr(MillisecondsBetween(Now,ElapsedTime))+' ms');
  ElapsedTime := Now;
  
  // PAS Count Objects
  Count := PAS_Object.Count;
  console.log('PAS Count: '+IntToStr(MillisecondsBetween(Now,ElapsedTime))+' ms');
end;

// console.log output: 
// JS Create: 1154 ms
// JS Count: 301 ms
// WC Create: 1006 ms
// WC Count: 272 ms
// PAS Create: 27439 ms
// PAS Count: 0 ms
 
