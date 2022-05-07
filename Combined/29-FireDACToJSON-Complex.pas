procedure TMyService.GetJSONData(ParametersOfSomeKind: String):TStream;  
var  
  clientDB: TFDConnection;  
  qry: TFDQuery;  
      
begin  
  Result := TMemoryStream.Create;  
      
  // Some kind of database connection  
  clientDB := TFDConnection.Create(nil);  
  clientDB.ConnectionDefName := SomeDatabaseConnection;  
  clientDB.Connected := True;  
      
  // Some kind of query  
  qry.Connection := clientDB;  
  qry.SQL.Text := 'select * from sample;';  
  qry.Open;  
      
  // Convert the query to FireDAC's JSON  
  qry.SaveToStream(Result, sfJSON);  
      
  // Cleanup afterwards  
  qry.Free;  
  clientDB.Connected := False;  
  clientDB.Free;  
end;  
    
