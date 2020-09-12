import 'package:http/http.dart';     //doubt
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;//location name for the Ui
  String time;//the time in the location
  String flag;//url to an asset  flag icon
  String url;//location url for api
  bool isDaytime; //true or false if daytime or not

  WorldTime({this.location,this.flag,this.url});


   Future<void> getTime() async{
   try{
     /*Response response =  await get('https://jsonplaceholder.typicode.com/todos/1');
   Map data = jsonDecode(response.body);
   print(data);
   print(data['title']);*/
     Response response = await get('http://worldtimeapi.org/api/timezone/$url');
     Map data = jsonDecode(response.body);
     //print(data);
     String date = data['datetime'];
     String offset = data['utc_offset'].substring(1,3);
     //  print(date);
     //print(offset);
     DateTime now =  DateTime.parse(date);
     now = now.add(Duration(hours: int.parse(offset)));
     //print(now);

     //set the time property
     //time = now.toString();
     isDaytime = now.hour>6 && now.hour<19 ? true : false;
     time = DateFormat.jm().format(now);
   }
   catch(e){
     print('caught error $e');
     time = 'could not get time data';

   }


  }
}
