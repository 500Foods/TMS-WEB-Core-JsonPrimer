procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  ElapsedTime: TDateTime;
  i: Integer;
  Count: Integer;
begin
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

end;

// console.log output: 
// WC Create: 1006 ms
// WC Count: 272 ms
 
