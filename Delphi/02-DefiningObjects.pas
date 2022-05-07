procedure TForm1.WebButton1Click(Sender: TObject);  
var  
  // Environment: Delphi (PAS)  
  PAS_Object: TJSONObject;  
  PAS_Array: TJSONArray;  

begin  

  // Environment: Delphi (PAS)  
  PAS_Object := TJSONObject.Create;  
  PAS_Array := TJSONArray.Create;  
  console.log('PAS Object = '+PAS_Object.ToString);  
  console.log('PAS Array = '+PAS_Array.ToString);  
      
end;  
    
// console.log output:   
// PAS Object = {}  
// PAS Array = []  
