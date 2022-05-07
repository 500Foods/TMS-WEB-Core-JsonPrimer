procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  
const
  SampleObjectData = '[[[123,{"key":true,"another key":"abc","more keys":[1,2,false]},null]]]';
  
  function WC_Print(Element:TJSObject; Indentation:String; Key:String):String;
  var
    str: String;
    typ: String;
  begin
    str := '';
    typ := '';
    if (Element = nil) then  begin str := 'Null (Null)'; typ := 'Null'; end
    else if (Element.ToString = 'true') then begin str := 'True (Boolean)'; typ := 'Boolean'; end
    else if (Element.ToString = 'false') then begin str := 'False (Boolean)'; typ := 'Boolean'; end
    else if (TJSJSON.stringify(Element).startsWith('"')) then begin str := Element.toString+' (String)'; typ := 'String'; end
    else if (TJSJSON.stringify(Element).startsWith('{')) then begin str := 'Object {'; typ := 'Object'; end
    else if (TJSJSON.stringify(Element).startsWith('[')) then begin str := 'Array ['; typ := 'Object'; end
    else begin str := Element.ToString+' (Number)'; typ := 'Number'; end;
    if (Key = '')
    then console.log(Indentation+' '+str)
    else console.log(Indentation+' '+Key+': '+str);
    Result := typ;
  end;
  
  procedure WC_Output(JSONObject:TJSObject; Indentation:String);
  var
    i: integer;
    typ: string;
  const
    indent = '____';
  begin
    if (TJSJSON.stringify(JSONObject).startsWith('[')) then
    begin
      if (Indentation = '') then
      begin
        console.log('WC [');
        Indentation := indent;
      end;
      for i := 0 to (length(TJSObject.keys(JSONObject))-1) do
      begin
        typ := WC_Print(TJSObject(JSONObject[String(TJSObject.keys(JSONObject)[i])]), Indentation, IntToStr(i));
        if (typ = 'Object') then
        begin
          WC_Output(TJSObject(JSONObject[String(TJSObject.keys(JSONObject)[i])]), Indentation+indent);
          console.log(Indentation+' }');
        end
        else if (typ = 'Array') then
        begin
          WC_Output(TJSObject(JSONObject[String(TJSObject.keys(JSONObject)[i])]), Indentation+indent);
          console.log(Indentation+' ]');
        end;
      end;
      if (Indentation = indent) then console.log(' ]');
    end
    else if (TJSJSON.stringify(JSONObject).startsWith('{')) then
    begin
      if (Indentation = '') then
      begin
        console.log('WC {');
        Indentation := '____';
      end;
      for i := 0 to (length(TJSObject.keys(JSONObject))-1) do
      begin
        typ := WC_Print(TJSObject(JSONObject[String(TJSObject.keys(JSONObject)[i])]), Indentation, string(TJSObject.keys(JSONObject)[i]));
        if (typ = 'Object') then
        begin
          WC_Output(TJSObject(JSONObject[String(TJSObject.keys(JSONObject)[i])]), Indentation+indent);
          console.log(Indentation+' }');
        end
        else if (typ = 'Array') then
        begin
          WC_Output(TJSObject(JSONObject[String(TJSObject.keys(JSONObject)[i])]), Indentation+indent);
          console.log(Indentation+' ]');
        end;
      end;
      if (Indentation = indent) then console.log('}');
    end
    else
    begin
      WC_Print(JSONObject,Indentation,'')
    end;
  end;
  
begin
  WC_Object := TJSJSON.parseObject(SampleObjectData);
  WC_Output(WC_Object,'');
end;

// console.log output 
// WC [
// ____ 0: Array [
// ________ 0: Array [
// ____________ 0: 123 (Number)
// ____________ 1: Object {
// ________________ key: True (Boolean)
// ________________ another key: "abc" (String)
// ________________ more keys: Array [
// ____________________ 0: 1 (Number)
// ____________________ 1: 2 (Number)
// ____________________ 2: False (Boolean)
// ________________ ]
// ____________ }
// ____________ 2: Null (Null)
// ________ ]
// ____ ]
// ]
