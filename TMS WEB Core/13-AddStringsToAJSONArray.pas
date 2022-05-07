procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Array: TJSArray;
  i: integer;
  
const
  SampleArrayData = '[{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"}]';
  
begin
  WC_Array := TJSArray(TJSJSON.parseObject(SampleArrayData));

  // #1: Add pineapple to the end of the array
  WC_Array.push(TJSJSON.parseObject('{"name":"pineapple","type":"fruit"}'));
  
  // #2: add radish to the beginning of the array
  WC_Array.unshift(TJSJSON.parseObject('{"name":"radish","type":"vegetable"}'));
  
  // #3: add peach before carrot in the array
  i := 0;
  while i < WC_Array.length do
  begin
    if string(TJSObject(WC_Array[i])['name']) = 'carrot' then
    begin
      WC_Array.splice(i,0,TJSJSON.parseObject('{"name":"peach","type":"fruit"}'));
      break;
    end;
    i := i + 1;
  end;
  
  console.log('WC array = '+TJSJSON.stringify(WC_Array));
end;

// console.log output: 
// WC array = [{"name":"radish","type":"vegetable"},{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"peach","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"},{"name":"pineapple","type":"fruit"}]
