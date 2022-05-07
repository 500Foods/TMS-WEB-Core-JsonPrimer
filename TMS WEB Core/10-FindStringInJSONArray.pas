procedure TForm1.WebButton1Click(Sender: TObject);  
var  
  WC_Array: TJSArray;  

const  
  SampleArrayData = '["apple","banana","orange","carrot","potato"]';  

begin  
  WC_Array := TJSArray(TJSJSON.parseObject(SampleArrayData));  

  console.log('WC Array: carrot position = '+IntToStr(WC_Array.indexOf('carrot')));  
  console.log('WC Array: Batman position = '+IntToStr(WC_Array.indexOf('Batman')));  
end;  

// console.log output:  
// WC Array: carrot position = 3  
// WC Array: Batman position = -1  
