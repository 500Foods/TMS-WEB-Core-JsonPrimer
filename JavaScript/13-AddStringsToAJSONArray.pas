procedure TForm1.WebButton1Click(Sender: TObject);
const
  SampleArrayData = '[{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"}]';
  
begin
  asm 
    var JS_Array = JSON.parse(SampleArrayData);
 
    // #1: Add pineapple to the end of the array
    JS_Array.push({"name":"pineapple","type":"fruit"});

    // #2: add radish to the beginning of the array
    JS_Array.unshift({"name":"radish","type":"vegetable"});

    // #3: add peach before carrot in the array
    JS_Array.splice(JS_Array.findIndex(obj => obj.name == 'carrot'),0,{"name":"peach","type":"fruit"});
  
    console.log('JS array = '+JSON.stringify(JS_Array)); 
  end;
end;

// console.log output: 
// JS array = [{"name":"radish","type":"vegetable"},{"name":"apple","type":"fruit"},{"name":"banana","type":"fruit"},{"name":"orange","type":"fruit"},{"name":"peach","type":"fruit"},{"name":"carrot","type":"vegetable"},{"name":"potato","type":"vegetable"},{"name":"pineapple","type":"fruit"}]
