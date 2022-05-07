procedure TForm1.WebButton1Click(Sender: TObject);  
const  
  SampleArrayData = '["apple","banana","orange","carrot","potato"]';  

begin  
  asm 
    var JS_Array = JSON.parse(SampleArrayData); 

   console.log('JS Array: carrot position = '+JS_Array.indexOf('carrot'));  
   console.log('JS Array: Batman position = '+JS_Array.indexOf('Batman'));  
  end;  
end;  

// console.log output:  
// JS Array: carrot position = 3  
// JS Array: Batman position = -1  
