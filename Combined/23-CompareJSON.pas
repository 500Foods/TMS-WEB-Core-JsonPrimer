procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object1: TJSObject;
  WC_Object2: TJSObject;
  PAS_Object1: TJSONObject;
  PAS_Object2: TJSONObject;
  
const
  SampleObjectData1 = '[[[123,{"key":true,"another key":"abc","more keys":[1,3,false]},null,[{"a":"1","b":2,"c":"3"}]]]]';
  SampleObjectData2 = '[[[123,{"another key":"abc","key":true,"more keys":[1,3,false]},null,[{"c":"3","b":2,"a":"1"}]]]]';
  
  function WC_Compare(Element1: TJSObject; Element2:TJSObJect):Boolean;
  var
    test: Boolean;
    i: integer;
  begin
    test := true;
    if ((Element1 = nil) and (Element2 = nil)) then test := true
    else if (Element1 = nil) or (Element2 = nil) then test := false
    else if ((Element1.toString = 'true') and (Element2.toString = 'true')) then test := true
    else if ((Element1.toString = 'false') and (Element2.toString = 'false')) then test := true
    else if (TJSJSON.stringify(Element1).startsWith('[')) and (TJSJSON.stringify(Element2).startsWith('['))  and (length(TJSObject.keys(Element1)) = length(TJSObject.keys(Element2))) then
    begin
      for i := 0 to (length(TJSObject.keys(Element1))-1) do
      begin
        if not(WC_Compare(TJSObject(Element1[String(TJSObject.keys(Element1)[i])]),TJSObject(Element2[String(TJSObject.keys(ELement2)[i])]))) then
        begin
          test := false;
        end;
      end;
    end
    else if (TJSJSON.stringify(Element1).startsWith('{')) and (TJSJSON.stringify(Element2).startsWith('{'))  and (length(TJSObject.keys(Element1)) = length(TJSObject.keys(Element2))) then
    begin
      for i := 0 to (length(TJSObject.keys(Element1))-1) do
      begin
        if not(WC_Compare(TJSObject(Element1[String(TJSObject.keys(Element1)[i])]),TJSObject(Element2[String(TJSObject.keys(Element1)[i])]))) then
        begin
          test := false;
        end;
      end;
    end
    else if (TJSJSON.stringify(Element1).startsWith('"')) and (TJSJSON.stringify(Element2).startsWith('"'))  and (Element1.toString = Element2.toString) then test := true
    else if (Element1.toString = Element2.toString) then test := true
    else
    begin
      test := false;
    end;
//    if not(test) then console.log(TJSJSON.stringify(Element1)+' <> '+TJSJSON.stringify(Element2));
    Result := test;
  end;
  
  function PAS_Compare(Element1: TJSONValue; Element2:TJSONValue):Boolean;
  var
    test: Boolean;
    i: integer;
  begin
    test := true;
    if ((Element1.ClassName = 'TJSONNull') and (Element2.Classname = 'TJSONNull')) then test := true
    else if ((Element1.ClassName = 'TJSONNull') or (Element2.Classname = 'TJSONNull')) then test := false
    else if ((Element1.ClassName = 'TJSONTrue') and (Element2.Classname = 'TJSONTrue')) then test := true
    else if ((Element1.ClassName = 'TJSONFalse') and (Element2.Classname = 'TJSONFalse')) then test := true
    else if ((Element1.ClassName = 'TJSONString') and (Element2.Classname = 'TJSONString')) and (Element1.ToString = Element2.ToString) then test := true
    else if ((Element1.ClassName = 'TJSONNumber') and (Element2.Classname = 'TJSONNumber')) and (Element1.ToString = Element2.ToString) then test := true
    else if ((Element1.ClassName = 'TJSONArray') and (Element2.Classname = 'TJSONArray')) and ((Element1 as TJSONArray).Count = (Element2 as TJSONArray).Count) then
    begin
      for i := 0 to ((Element1 as TJSONArray).Count - 1) do
      begin
        if not(PAS_Compare((Element1 as TJSONArray).Items[i], ((Element2 as TJSONArray).Items[i]))) then
        begin
          test := false;
        end;
      end;
    end
    else if ((Element1.ClassName = 'TJSONObject') and (Element2.Classname = 'TJSONObject')) and ((Element1 as TJSONOBject).Count = (Element2 as TJSONObject).Count) then
    begin
      for i := 0 to ((Element1 as TJSONObject).Count - 1) do
      begin
        if not(PAS_Compare((Element1 as TJSONObject).Pairs[i].JSONValue,(Element2 as TJSONObject).Get((Element1 as TJSONObject).Pairs[i].JSONString.value).JSONValue)) then
        begin
          test := false;
        end;
      end;
    end
    else
    begin
      if Element1.ToString <> Element2.toString
      then test := false
      else test := true;
    end;
//    if not(test) then console.log(Element1.ToString+' <> '+Element2.ToString);
    Result := test;
  end;
  
begin
  asm var JS_Object1 = JSON.parse(SampleObjectData1); end;
  asm var JS_Object2 = JSON.parse(SampleObjectData2); end;
  WC_Object1 := TJSJSON.parseObject(SampleObjectData1);
  WC_Object2 := TJSJSON.parseObject(SampleObjectData2);
  PAS_Object1 := TJSONObject.ParseJSONValue(SampleObjectData1) as TJSONObject;
  PAS_Object2 := TJSONObject.ParseJSONValue(SampleObjectData2) as TJSONObject;
  
  asm
    function JS_Compare(Element1, Element2) {
      var test = true;
      if ((Element1 === null) && (Element2 === null)) {test = true}
      else if ((Element1 === null) || (Element2 === null)) {test = false}
      else if ((Element1 === true) && (Element2 === true)) {test = true}
      else if ((Element1 === false) && (Element2 === false)) {test = true}
      else if ((Array.isArray(Element1)) && (Array.isArray(Element2)) && (Element1.length == Element2.length)) {
        for (var i = 0; i < Element1.length; i++) {
          if (!JS_Compare(Element1[i],Element2[i])) {
            test = false;
          }
        }
      }
      else if ((typeof Element1 === 'string') && (typeof Element2 === 'string') && (Element1 === Element2)) {test = true}
      else if ((typeof Element1 === 'number') && (typeof Element2 === 'number') && (Element1 === Element2)) {test = true}
      else if ((typeof Element1 === 'object') && (typeof Element2 === 'object') && (Object.keys(Element1).length == Object.keys(Element2).length)) {
        for (var key in Element1) {
          if (!JS_Compare(Element1[key],Element2[key])) {
            test = false;
          }
        }
      }
      else {
        test = false;
      }
//      if (!test) {console.log(JSON.stringify(Element1)+' <> '+JSON.stringify(Element2))};
      return(test);
    }
  end;
  
  asm console.log('JS '+JS_Compare(JS_Object1, JS_Object2)); end;
  console.log('WC '+BoolToStr(WC_Compare(WC_Object1,WC_Object2),true));
  console.log('PAS '+BoolToStr(PAS_Compare(PAS_Object1,PAS_Object2),true));
end;

// console.log output:
// JS true
// WC True
// PAS True
