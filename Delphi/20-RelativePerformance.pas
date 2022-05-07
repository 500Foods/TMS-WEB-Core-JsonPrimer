procedure TForm1.WebButton1Click(Sender: TObject);
var
  PAS_Object: TJSONObject;
  ElapsedTime: TDateTime;
  i: Integer;
  Count: Integer;
begin
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
// PAS Create: 27439 ms
// PAS Count: 0 ms
 
