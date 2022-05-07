    procedure TMyService.GetJSONData(ParametersOfSomeKind: String):TStream;  
    var  
      clientDB: TFDConnection;  
      qry: TFDQuery;  
      bm: TFDBatchMove;  
      bw: TFDBatchMoveJSONWriter;  
      br: TFDBatchMoveDataSetReader;  
      
    begin  
      Result := TMemoryStream.Create;  
      
      // Some kind of database connection  
      clientDB := TFDConnection.Create(nil);  
      clientDB.ConnectionDefName := SomeDatabaseConnection;  
      clientDB.Connected := True;  
      
      // Some kind of query  
      qry.Connection := clientDB;  
      qry.SQL.Text := 'select * from DATAMARK.LUTS;';  
      qry.Open;  
      
      // Convert the query to simplified JSON  
      bm := TFDBatchMove.Create(nil);  
      bw := TFDBatchMoveJSONWriter.Create(nil);  
      br := TFDBatchMoveDataSetReader.Create(nil);  
      try  
        br.Dataset := qry;  
        bw.Stream := Result;  
        bm.Reader := br;  
        bm.Writer := bw;  
        bm.Execute;  
      finally  
        br.Free;  
        bw.Free;  
        bm.Free;  
      end;  
      
      // Cleanup afterwards  
      qry.Free;  
      clientDB.Connected := False;  
      clientDB.Free;  
    end;  
    
