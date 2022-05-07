procedure TForm1.WebButton1Click(Sender: TObject);
var
  PAS_Object: TJSONObject;
  
const
  SampleObjectData = '[[[123,{"key":true,"another key":"abc","more keys":[1,2,false]},null]]]';
  
  function PAS_Print(Element:TJSONValue; Indentation:String; Key:String):String;
  var
    str: String;
    typ: String;
  begin
    str := '';
    typ := '';
    if (Element.ClassName = 'TJSONNull') then begin str := 'Null (Null)'; typ := 'Null'; end
    else if (Element.ClassName = 'TJSONTrue') then begin str := 'True (Boolean)'; typ := 'Boolean'; end
    else if (Element.ClassName = 'TJSONFalse') then begin str := 'False (Boolean)'; typ := 'Boolean'; end
    else if (Element.ClassName = 'TJSONString') then begin str := Element.toString+' (String)'; typ := 'String'; end
    else if (Element.ClassName = 'TJSONNumber') then begin str := Element.toString+' (Number)'; typ := 'String'; end
    else if (Element.ClassName = 'TJSONObject') then begin str := 'Object {'; typ := 'Object'; end
    else if (Element.ClassName = 'TJSONArray') then begin str := 'Array ['; typ := 'Object'; end;
    if (Key = '')
    then console.log(Indentation+' '+str)
    else console.log(Indentation+' '+Key+': '+str);
    Result := typ;
  end;
  
  procedure PAS_Output(JSONObject:TJSONObject; Indentation:String);
  var
    i: integer;
    typ: string;
  const
    indent = '____';
  begin
    if (JSONObject.ClassName = 'TJSONArray') then
    begin
      if (Indentation = '') then
      begin
        console.log('PAS [');
        Indentation := indent;
      end;
     for i := 0 to ((JSONObject as TJSONArray).Count - 1) do
      begin
        typ := PAS_Print((JSONObject as TJSONArray)[i] as TJSONValue, Indentation, IntToStr(i));
        if (typ = 'Object') then
        begin
          PAS_Output((JSONObject as TJSONArray)[i] as TJSONObject, Indentation+indent);
          console.log(Indentation+' }');
        end
        else if (typ = 'Array') then
        begin
          PAS_Output((JSONObject as TJSONArray)[i] as TJSONArray, Indentation+indent);
          console.log(Indentation+' ]');
        end;
      end;
      if (Indentation = indent) then console.log(']');
    end
    else if (JSONObject.ClassName = 'TJSONObject') then
    begin
      if (Indentation = '') then
      begin
        console.log('PAS {');
        Indentation := '____';
      end;
      for i := 0 to (JSONObject.Count - 1) do
      begin
        typ := PAS_Print(JSONObject.Items[i], Indentation, JSONObject.Pairs[i].JSONString.Value);
        if (typ = 'Object') then
        begin
          PAS_Output(JSONObject.Items[i] as TJSONObject, Indentation+indent);
          console.log(Indentation+' }');
        end
        else if (typ = 'Array') then
        begin
         PAS_Output(JSONObject.Items[i] as TJSONArray, Indentation+indent);
          console.log(Indentation+' ]');
        end;
      end;
      if (Indentation = indent) then console.log('}');
    end
    else
    begin
      PAS_Print(JSONObject,Indentation,'')
    end;
  end;
  
begin
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;
  PAS_Output(PAS_Object,'');
end;

// console.log output 
// PAS [
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
//
