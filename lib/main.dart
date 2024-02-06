import 'package:flutter/material.dart';
import 'package:fruitapp/FruitDataModel.dart';
import 'package:fruitapp/FruitDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<String> fruitname = [
    'Apple',
    'Banana',
    'Mango',
    'Orange',
    'Pineapple',
    'Watermelom'
  ];

  static List url = [
    'https://w7.pngwing.com/pngs/399/447/png-transparent-red-apple-illustration-juice-apple-fruit-graphy-red-apple-natural-foods-food-leaf-thumbnail.png',
    'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg',
    'https://w7.pngwing.com/pngs/790/811/png-transparent-sliced-mangoe-juice-mango-alphonso-fruit-flavor-mango-food-dried-fruit-tropical-fruit-thumbnail.png',
    'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
    'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg',
    'https://w7.pngwing.com/pngs/871/532/png-transparent-watermelon-watermelon-natural-foods-food-melon-thumbnail.png'
  ];

  static List Dec = [
    'เป็นต้นไม้ผลัดใบในวงศ์กุหลาบ มีผลรสหวานเรียกว่า ผลแอปเปิล แอปเปิลมีปลูกอยู่ทั่วโลกในลักษณะของไม้ผล และสายพันธุ์ที่ถูกปลูกมากที่สุดคือสกุล Malus',
    'เป็นผลไม้ที่มีสารอาหารครบถ้วน ทั้งคาร์โบไฮเดรต เกลือแร่ แคลเซียม แมกนีเซียม ฟอสฟอรัส และเหล็ก วิตามินก็มีครบ ทั้งวิตามินเอ บี อี ซี และยังมีสารต้านอนุมูลอิสระ ชะลอความแก่ ป้องกันมะเร็ง คลายเครียด',
    'เป็นผลไม้ชนิดหนึ่งที่มีรสชาติดี รับประทานได้ทั้งผลดิบและผลสุก ให้พลังงานสูง เป็นแหล่งอาหารที่สำคัญของโพแทสเซียม เส้นใยอาหาร และวิตามิน',
    'ผลไม้ในตระกูล Citrus รสชาติเปรี้ยวปนหวาน กลิ่นหอม มีวิตามินซีสูง หลากหลายสายพันธุ์ ราคาไม่แพง อุดมไปด้วยสรรพคุณทางยา เป็นประโยชน์ต่อสุขภาพร่างกาย',
    'เป็นผลไม้ที่มีฤทธิ์เป็นกรดอ่อน เนื่องจากมีกรดซิตริก และกรดมาลิก เป็นองค์ประกอบ จึงทำให้สับปะรดมีรสเปรี้ยว ',
    'เป็นผลไม้ชนิดหนึ่ง เป็นพืชในวงศ์เดียวกับแคนตาลูปและฟัก จัดเป็นพืชล้มลุกเป็นเถา อายุสั้น เถาจะเลื้อยไปตามพื้นดิน มีขนอ่อนปกคลุม ผลมีทั้งทรงกลมและทรงกระบอก เปลือกแข็ง มีทั้งสีเขียวและสีเหลือง บางพันธุ์มีลวดลายบนเปลือก ในเนื้อมีเมล็ดสีดำแทรกอยู่'
  ];

  final List<FruitDataModel> Fruitdata = List.generate(
      fruitname.length,
      (index) => FruitDataModel('${fruitname[index]}', '${url[index]}',
          '${fruitname[index]} ${Dec[index]}'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.food_bank_outlined),
          backgroundColor: Colors.cyan,
          title: Text('Fruit',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.cyanAccent[100],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: Fruitdata.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(Fruitdata[index].name,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network(Fruitdata[index].ImageUrl,fit: BoxFit.fill,),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FruitDetail(
                                    fruitDataModel: Fruitdata[index],
                                  )));
                        },
                      ),
                    );
                  }),
            ),
          ),
        ));
  }
}
