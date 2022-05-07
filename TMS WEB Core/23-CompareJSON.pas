procedure TForm1.WebButton1Click(Sender: TObject);
var
  WC_Object1: TJSObject;
  WC_Object2: TJSObject;

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
  
begin
  WC_Object1 := TJSJSON.parseObject(SampleObjectData1);
  WC_Object2 := TJSJSON.parseObject(SampleObjectData2);
  console.log('WC '+BoolToStr(WC_Compare(WC_Object1,WC_Object2),true));
end;

// console.log output:
// WC True
