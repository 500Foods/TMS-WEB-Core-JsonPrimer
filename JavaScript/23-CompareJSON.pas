procedure TForm1.WebButton1Click(Sender: TObject);
const
  SampleObjectData1 = '[[[123,{"key":true,"another key":"abc","more keys":[1,3,false]},null,[{"a":"1","b":2,"c":"3"}]]]]';
  SampleObjectData2 = '[[[123,{"another key":"abc","key":true,"more keys":[1,3,false]},null,[{"c":"3","b":2,"a":"1"}]]]]';

begin
  asm 
    var JS_Object1 = JSON.parse(SampleObjectData1);
    var JS_Object2 = JSON.parse(SampleObjectData2);

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
  
    console.log('JS '+JS_Compare(JS_Object1, JS_Object2));
  end;
end;

// console.log output:
// JS true
