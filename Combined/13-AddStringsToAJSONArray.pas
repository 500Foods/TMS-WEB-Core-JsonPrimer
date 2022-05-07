procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Array: TJSArray;
  PAS_Array: TJSONArray;
  i: integer;
  tmparray: TJSONArray;
  
const
  SampleArrayData = '[{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"}]';
  
begin
  asm var JS_Array = JSON.parse(SampleArrayData); end;
  WC_Array := TJSArray(TJSJSON.parseObject(SampleArrayData));
  PAS_Array := TJSONObject.ParseJSONValue(SampleArrayData) as TJSONArray;

  // What we're aiming to do here:     
  // #1: Add pineapple to the end of the array
  // #2: add radish to the beginning of the array
  // #3: add peach before carrot in the array
  
  asm
    // #1: Add pineapple to the end of the array
    JS_Array.push({"name":"pineapple","type":"fruit"});
    // #2: add radish to the beginning of the array
    JS_Array.unshift({"name":"radish","type":"vegetable"});
    // #3: add peach before carrot in the array
    JS_Array.splice(JS_Array.findIndex(obj => obj.name == 'carrot'),0,{"name":"peach","type":"fruit"});
  end;
  
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
  
  // #1: Add pineapple to the end of the array
  PAS_Array.Add(TJSONObject.ParseJSONValue('{"name":"pineapple","type":"fruit"}') as TJSONObject);
  // #2: add radish to the beginning of the array
  tmparray := TJSONObject.ParseJSONValue('[{"name":"radish","type":"vegetable"}]') as TJSONArray;
  i := 0;
  while i < PAS_Array.count  do
  begin
    tmparray.Add(Pas_Array[i] as TJSONObject);
    i := i + 1;
  end;
  PAS_Array := tmpArray;
  // #3: add peach before carrot in the array
  PAS_Array.Add(TJSONObject.ParseJSONValue('{"name":"pineapple","type":"fruit"}') as TJSONObject);
  tmparray := TJSONObject.ParseJSONValue('[]') as TJSONArray;
  i := 0;
  while i < PAS_Array.count  do
  begin
    if (((Pas_Array[i] as TJSONObject).getValue('name') as TJSONString).Value = 'carrot')
    then tmpArray.Add(TJSONObject.ParseJSONValue('{"name":"peach","type":"fruit"}') as TJSONObject);
    tmparray.Add(Pas_Array[i] as TJSONObject);
    i := i + 1;
  end;
  PAS_Array := tmpArray;
  
  asm console.log('JS array = '+JSON.stringify(JS_Array)); end;
  console.log('WC array = '+TJSJSON.stringify(WC_Array));
  console.log('PAS array = '+PAS_Array.ToString);
end;

// console.log output: 
// JS array = [{"name":"radish","type":"vegetable"},{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"peach","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"},{"name":"pineapple","type":"fruit"}]
// WC array = [{"name":"radish","type":"vegetable"},{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"peach","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"},{"name":"pineapple","type":"fruit"}]
// PAS array = [{"name":"radish","type":"vegetable"},{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"peach","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"},{"name":"pineapple","type":"fruit"}]
