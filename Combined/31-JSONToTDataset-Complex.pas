function GetQueryData(Endpoint: String; Dataset: TXDataWebDataSet):Integer;
var
  Conn:     TXDataWebConnection;
  Client:   TXDataWebClient;
  Response: TXDataClientResponse;
  JFDBS:       TJSObject;
  JManager:    TJSObject;
  JTableList:  TJSObject;
  JColumnList: TJSArray;
  JRowList:    TJSArray;
  StringFields:  Array of TStringField;
  IntegerFields: Array of TIntegerField;
  // Likely need a few more datatypes here
  i: Integer;
  
begin
  // Value to indicate the request was unsuccessful
  Result := -1;
  
  // Setup connection to XData Server
  Conn              := TXDataWebConnection.Create(nil);
  Conn.URL          := DM1.CarnivalCoreServer;          // could also be a parameter
  Conn.OnRequest    := PopulateJWT;                     // See below
  Client            := TXDataWebClient.Create(nil);
  Client.Connection := Conn;
  await(Conn.OpenAsync);
  
  // Make the Request 
  // Likely to have another version of function that includes more endpoint parameters
  try
    Response := await(Client.RawInvokeAsync(Endpoint, ['FireDAC']));
  except
    on Error: Exception do
    begin
      Client.Free;
      Conn.Free;
      console.log('...something is amiss...');
      exit;
    end;
  end;
  
  // Process the FireDAC-specific JSON that was returned
  JFDBS       := TJSObject(TJSObject(TJSJson.Parse(string(Response.Result)))['FDBS']);
  JManager    := TJSObject(JFDBS['Manager']);
  JTableList  := TJSObject(TJSArray(JManager['TableList'])[0]);
  JColumnList := TJSArray(JTableList['ColumnList']);
  JRowList    := TJSArray(JTableList['RowList']);
  
  // Don't really want 'Original' in field names, so let's remove it from JSON first
  // Probably a better one-liner, but this seems to work
  for i := 0 to JRowList.Length - 1 do
    JRowList.Elements[i] := TJSObject(JRowList.Elements[i])['Original'];
    
  // We're assuming Dataset parameter is newly created and empty.  
  // First, add all the fields from JSON
  // NOTE: Very likely more datatypes need to be added here
  for i := 0 to JColumnList.Length-1 do
  begin
    if (String(TJSObject(JColumnList.Elements[i])['DataType']) = 'AnsiString') then
    begin
      // NOTE: Different datatypes may need different values set (eg: Size for strings)
      SetLength(StringFields, Length(StringFields) + 1);
      StringFields[Length(StringFields)-1] := TStringField.Create(Dataset);
      StringFields[Length(StringFields)-1].FieldName := String(TJSObject(JColumnList.Elements[i])['Name']);
      StringFields[Length(StringFields)-1].Size      := Integer(TJSObject(JColumnList.Elements[i])['Size']);
      StringFields[Length(StringFields)-1].Dataset   := Dataset;
    end
    else if (String(TJSObject(JColumnList.Elements[i])['DataType']) = 'Int32') then
    begin
      SetLength(IntegerFields, Length(IntegerFields) + 1);
      IntegerFields[Length(IntegerFields)-1] := TIntegerField.Create(Dataset);
      IntegerFields[Length(IntegerFields)-1].FieldName := String(TJSObject(JColumnList.Elements[i])['Name']);
      IntegerFields[Length(IntegerFields)-1].Dataset   := Dataset;
    end
    else
    begin
      console.log('ERROR: Field ['+String(TJSObject(JColumnList.Elements[i])['Name'])+'] has an unexpected datatype ['+String(TJSObject(JColumnList.Elements[i])['DataType'])+']');
    end;
  end;
  
  // Add the data and return the dataset as opened
  Dataset.SetJSONData(JRowList);
  Dataset.Open;
  
  // Just for fun
  Result :=  Dataset.RecordCount;
  
  // No dataset stuff to free as the dataset was created by the caller and 
  // all the fields created were created with that dataset as the parent
  Client.Free;
  Conn.Free;
end;
