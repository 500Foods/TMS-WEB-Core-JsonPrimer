    procedure TForm1.WebButton1Click(Sender: TObject);  
    var  
      WC_Object: TJSObject;  
      
    const  
      SampleObjectData = '[{"ID":1,"LOOKUP":0,"SORTORDER":0,"RESPONSE":"Administration","MODIFIER":"ASIMARD","MODIFIED":"2021-11-17T19:42:34","GROUPTYPE":16},'+  
                          '{"ID":2,"LOOKUP":1,"SORTORDER":1,"RESPONSE":"Labour","MODIFIER":"ASIMARD","MODIFIED":"2021-11-17T19:47:52","GROUPTYPE":16},'+  
                          '{"ID":3,"LOOKUP":2,"SORTORDER":2,"RESPONSE":"IT","MODIFIER":"ASIMARD","MODIFIED":"2021-11-17T19:42:56","GROUPTYPE":16}]';  
                          
    begin  
      WC_Object := TJSJSON.parseObject(SampleObjectData);  
      XDataWebDataSet1.SetJSONData(WC_Object);  
      XdataWebDataSet1.Open;  
    end;  
    
