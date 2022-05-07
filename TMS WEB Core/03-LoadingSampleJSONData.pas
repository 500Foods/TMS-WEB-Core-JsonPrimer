procedure TForm1.WebButton1Click(Sender: TObject);  
var  
  WC_Array: TJSArray;  
  BigSampleData: WideString;  
begin  
  // Credit: https://gist.github.com/ggordonutech/c04f47fcdad76f8e5e77ee38a9614773  
  BigSampleData := '['+  
                    '{"id":1,"name":"Banana","description":"A banana is an edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called plantains, distinguishing them from dessert banana","photoUrl":"http://www.pngall.com/wp-content/uploads/2016/04/Banana-PNG.png"},'+  
                    '{"id":2,"name":"Apple","description":"An apple is a sweet, edible fruit produced by an apple tree. Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus.","photoUrl":"https://images.freshop.com/00852201002228/ad2f58915e3267700906f1025ef8917f_medium.png"},'+  
                    '{"id":3,"name":"Peach","description":"The peach is a deciduous tree native to the region of Northwest China between the Tarim Basin and the north slopes of the Kunlun Mountains, where it was first domesticated and cultivated. It bears an edible juicy fruit called a peach or a nectarine.","photoUrl":"http://icons.iconarchive.com/icons/artbees/paradise-fruits/256/Peach-icon.png"},'+  
                    '{"id":4,"name":"Strawberry","description":"The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness.","photoUrl":"https://static.wixstatic.com/media/2cd43b_7415c9b79d664508b6f62a6953403b75~mv2.png/v1/fill/w_256,h_256,fp_0.50_0.50/2cd43b_7415c9b79d664508b6f62a6953403b75~mv2.png"},'+  
                    '{"id":5,"name":"Tomato","description":"The tomato is the edible, often red, berry of the plant Solanum lycopersicum, commonly known as a tomato plant. The species originated in western South America and Central America.","photoUrl":"https://www.kampexport.com/sites/kampexport.com/files/images/legume/image/tomates_256_1.jpg"},'+  
                    '{"id":6,"name":"Cherry","description":"A cherry is the fruit of many plants of the genus Prunus, and is a fleshy drupe. Commercial cherries are obtained from cultivars of several species, such as the sweet Prunus avium and the sour Prunus cerasus.","photoUrl":"https://cdn.shopify.com/s/files/1/0610/2881/products/cherries.jpg?v=1446676415"}'+  
                   ']';  
  WC_Array := TJSArray(TJSJSON.parseObject(BigSampleData));  
  console.log('WC Array = '+TJSJSON.stringify(WC_Array));  
end;  
