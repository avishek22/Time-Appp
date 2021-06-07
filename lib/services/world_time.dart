import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({this.location,this.flag,this.url});

 Future<void>  getTime() async{
   try {
     // String username =await Future.delayed(Duration(seconds: 3),(){
     //   return 'avishek';
     // });
     // String bio=await Future.delayed(Duration(seconds: 2),(){
     //   return 'musician';
     // });
     // print('$username - $bio');
     var Url = Uri.parse('https://worldtimeapi.org/api/timezone/$url');

     Response response = await get(Url);
     Map data = jsonDecode(response.body);
     // print(data);
     String datetime = data['datetime'];
     String sign = data['utc_offset'].substring(0, 1);
     String offset = data['utc_offset'].substring(1, 3);
     String offsetmin = data['utc_offset'].substring(4, 6);
     // print(sign);
     //  print(offsetmin);
     //  print(datetime);
     //  print(offset);

     DateTime now = DateTime.parse(datetime);
     //print(now);
     if (sign == '+') {
       now = now.add(
           Duration(hours: int.parse(offset), minutes: int.parse(offsetmin)));
     }
     else {
       now = now.subtract(
           Duration(hours: int.parse(offset), minutes: int.parse(offsetmin)));
     }
    isDayTime=now.hour>6 && now.hour<20?true:false;
     time = DateFormat.jm().format(now);

   }
   catch(e){
     print('caught error:$e');
     time='could not get time data';
   }
    //print(now);

  }
}