    procedure TForm1.WebButton1Click(Sender: TObject);  
    var  
      WC_Object: TJSObject;  
      
    const  
      SampleObjectData = '{"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}';  
      
    begin  
      WC_Object := TJSJSON.parseObject(SampleObjectData);  
      
      // JS: Works as if it were natively defined in JS  
      asm  
        console.log('JS: '+JSON.stringify(WC_Object));  
        console.log('JS: '+Object.keys(WC_Object).length);  
      end;  
      
      // PAS: Converting to a TJSONObject via Strings works as before  
      console.log('PAS: '+(TJSONObject.parseJSONValue(TJSJSON.stringify(WC_Object)) as TJSONObject).ToString);  
      console.log('PAS: '+IntToStr((TJSONObject.parseJSONValue(TJSJSON.stringify(WC_Object)) as TJSONObject).Count));  
      
    end;  
    
    // console.log output:  
    // JS: {"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}  
    // JS: 5  
    // PAS: {"apple":"fruit","banana":"fruit","orange":"fruit","carrot":"vegetable","potato":"vegetable"}  
    // PAS: 5    
       
