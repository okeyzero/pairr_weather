import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Get my weather information'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//@override
//void initState() {
//  getHomePageContent().then((val){
//    setState(() {
//      homePageContent=val.toString();
//    });
//  });
//  super.initState();
//}


class _MyHomePageState extends State<MyHomePage> {
  @override
  String CityName="";
  String weather="";
  String win="";
  String infomation;
  void initState(){
    getData();
    super.initState();
  }
  void getData() async{
    http.get('https://tianqiapi.com/api?version=v6&appid=36728434&appsecret=ZiqL5VBH').then((http.Response response){
      var jsonData =json.decode(response.body);
      print(jsonData);
      CityName=jsonData["city"];
      print(CityName);
      weather=jsonData["wea"];
      print(weather);
      win=jsonData["win"];
      print(win);
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "天气查询",
                style: Theme.of(context).textTheme.display1
            ),
            Text("你的城市是："+ CityName+'\n'+"当前天气情况："+weather+'\n'+"当前风："+win,
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
        tooltip: 'Increment',
        child: Icon(Icons.update),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//"晴","阴","多云","雨夹雪","小雨","中雨","阵雨","小雪","中雪","大雪","大雨","雾","暴雨","雷阵雨","阵雪","暴雪","扬沙",
// "大暴雨","霾","浮尘","晴转多云","小雪转晴","多云转晴","多云转阴","晴转阴","阴转多云","多云转小雪","阵雪转晴","晴转阵雪",
// "小雪转多云","小雨转多云","晴转小雪","多云转雨夹雪","多云转阵雪","阵雨转多云","多云转小雨","多云转阵雨","阵雪转小雪",
// "阴转小雪","小雪转阴","阵雪转多云","阴转晴","阴转阵雪","阵雪转阴","扬沙转多云","扬沙转晴","浮尘转晴","晴转雨夹雪",
// "多云转中雪","晴转中雪","阴转小雨","小雨转中雨","小雨转阴","中雨转多云","中雨转小雨","阴转中雨","多云转中雨","小雨转大雨",
// "阵雨转中雨","阵雨转大雨","阴转大雨","雾转多云","阵雨转小雨","中雨转阴","晴转小雨","多云转大雨","小雨转暴雨","阵雨转晴",
// "小雨转晴","阵雨转中到大雨","小雨转阵雨","阵雨转阴","雨夹雪转晴","雨夹雪转多云","小雨转小雪","小雪转雨夹雪","阴转阵雨",
// "小雨转小到中雨","小到中雨转小雨","小到中雨转阴","晴转阵雨","中雨转阵雨","阵雨转雷阵雨","多云转大雪","阴转中雪",
// "阴转大雪","雨夹雪转阴","雨夹雪转小雪","小雨转大雪","雨夹雪转大雪","雨夹雪转中雪","中雨转小雪","中雨转中雪","晴转大雪",
// "小雨转雨夹雪","阴转雨夹雪","多云转雾","小雪转阵雪","小雪转中雪","多云转小到中雪","中雪转多云","中雪转小雪","大雪转小雪",
// "中雨转大雨","阵雨转雨夹雪","多云转小到中雨","小到中雨","小到中雨转阵雨","小雨转阵雪","雷阵雨转多云","雷阵雨转阵雨","多云转扬沙",
// "晴转扬沙","扬沙转阴","浮尘转霾","晴转霾","霾转阴","霾转多云","霾转晴","小到中雪转多云","大雪转多云","雨夹雪转小雨",
// "大雨转阴","浮尘转多云","多云转霾","晴转雾","小雨转中雪","阵雨转小雪","晴转雷阵雨","阴转雾"
//
//古诗中：
//晴     清晨入古寺，初日照高林
//阴天    林峦少平地,雾雨多阴天
//风      林花谢了春红，太匆匆。无奈朝来寒雨晚来风。
//北风     支离东北风尘际，漂泊西南天地间。
//南风     夜来南风起，小麦覆陇黄。
//东风   等闲识得东风面，万紫千红总是春。
//西风  昨夜西风凋碧树，独上高楼，望尽天涯路
//云   曾经沧海难为水，除却巫山不是云。
//雨   雨打梨花深闭门，忘了青春，误了青春
//小雨  自在飞花轻似梦，无边丝雨细如愁 沾衣欲湿杏花雨，吹面不寒杨柳风
//阵雨 骤雨发芳香，回风舒锦绮。
//大雨  雷声千嶂落,雨色万峰来
//雪  人生到处知何似，应似飞鸿踏雪泥。        梅须逊雪三分白，雪却输梅一段香。
//小雪 檐飞数片雪，瓶插一枝梅。    花雪随风不厌看，更多还肯失林峦

