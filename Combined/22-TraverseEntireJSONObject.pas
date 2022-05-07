procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object: TJSObject;
  PAS_Object: TJSONObject;
  
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
  asm var JS_Object = JSON.parse(SampleObjectData); end;
  WC_Object := TJSJSON.parseObject(SampleObjectData);
  PAS_Object := TJSONObject.ParseJSONValue(SampleObjectData) as TJSONObject;
  
  asm
    function JS_Print(Element, Indentation, Key) {
      var str = '';
      var typ = '';
      if (Element === null) { str = 'Null (Null)'; typ = 'Null'; }
      else if (Element === true) { str = 'True (Boolean)'; typ = 'Boolean'; }
      else if (Element === false) { str = 'False (Boolean)'; typ = 'Boolean'; }
      else if (Array.isArray(Element)) { str = 'Array ['; typ = 'Array'; }
      else if (typeof Element === 'string') { str = '"'+Element+'" (String)'; typ = 'String'; }
      else if (typeof Element === 'number') { str = Element+' (Number)'; typ = 'Number'; }
      else if (typeof Element === 'object') { str = 'Object {'; typ = 'Object'; }
      if (Key === undefined) { console.log(Indentation+' '+str); }
      else                   { console.log(Indentation+' '+Key+': '+str); }
      return(typ)
    }
    
    function JS_Output(JSONObject, Indentation) {
      const indent = '____';
      if (Array.isArray(JSONObject)) {
        if (Indentation == '') {
          console.log("JS [");
          Indentation = indent;
        }
        for (var i = 0; i < JSONObject.length; i++) {
          switch (JS_Print(JSONObject[i],Indentation,i)) {
            case 'Object': JS_Output(JSONObject[i],Indentation+indent); console.log(Indentation+" }"); break;
            case 'Array': JS_Output(JSONObject[i],Indentation+indent); console.log(Indentation+" ]"); break;
          }
        }
        if (Indentation == indent) { console.log("]") }
      }
      else if (typeof JSONObject === 'object') {
        if (Indentation == '') {
          console.log("JS {");
          Indentation = '____';
        }
        for (var key in JSONObject) {
          switch (JS_Print(JSONObject[key],Indentation,key)) {
            case 'Object': JS_Output(JSONObject[key],Indentation+indent); console.log(Indentation+" }"); break;
            case 'Array': JS_Output(JSONObject[key],Indentation+indent); console.log(Indentation+" ]"); break;
          }
        }
        if (Indentation == indent) { console.log("}") }
      }
      else {
        JS_Print(JSONObject,Indentation);
      }
    }
  end;
  
  asm JS_Output(JS_Object,''); end;
  WC_Output(WC_Object,'');
  PAS_Output(PAS_Object,'');
end;

// console.log output 
// JS [
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
//
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
