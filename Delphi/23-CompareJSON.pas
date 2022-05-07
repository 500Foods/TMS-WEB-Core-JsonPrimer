procedure TForm1.WebButton1Click(Sender: TObject);
var
  PAS_Object1: TJSONObject;
  PAS_Object2: TJSONObject;
const
  SampleObjectData1 = '[[[123,{"key":true,"another key":"abc","more keys":[1,3,false]},null,[{"a":"1","b":2,"c":"3"}]]]]';
  SampleObjectData2 = '[[[123,{"another key":"abc","key":true,"more keys":[1,3,false]},null,[{"c":"3","b":2,"a":"1"}]]]]';

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
  PAS_Object1 := TJSONObject.ParseJSONValue(SampleObjectData1) as TJSONObject;
  PAS_Object2 := TJSONObject.ParseJSONValue(SampleObjectData2) as TJSONObject;
  console.log('PAS '+BoolToStr(PAS_Compare(PAS_Object1,PAS_Object2),true));
end;

// console.log output:
// PAS True
