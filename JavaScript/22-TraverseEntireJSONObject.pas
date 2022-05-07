procedure TForm1.WebButton1Click(Sender: TObject);
const
  SampleObjectData = '[[[123,{"key":true,"another key":"abc","more keys":[1,2,false]},null]]]';
  
begin
  asm 
    var JS_Object = JSON.parse(SampleObjectData);
  
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
  
    JS_Output(JS_Object,''); 
  end;
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
