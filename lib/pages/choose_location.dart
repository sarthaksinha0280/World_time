import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Singapore',location: 'Singapore',flag: 'Singapore.png'),
    WorldTime(url: 'Asia/Tokyo',location: 'Tokyo',flag: 'Tokyo.jpg'),
    WorldTime(url: 'Asia/Dubai',location: 'Dubai',flag: 'Dubai.png'),
    WorldTime(url: 'America/New_York',location: 'New_York',flag: 'New_York.png'),
    WorldTime(url: 'America/Mexico_City',location: 'Mexico_City',flag: 'Mexico_City.png'),
    WorldTime(url: 'America/Los_Angeles',location: 'Los_Angeles',flag: 'Los_Angeles.jpg'),
    WorldTime(url: 'Europe/Berlin',location: 'Berlin',flag: 'Berlin.png'),
    WorldTime(url: 'Europe/London',location: 'London',flag: 'London.jpg'),
  ];


  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to  home screen
    Navigator.pop(context,{
    'location':instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'isDaytime':instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {//so many time
    //print('build');
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose a Location'),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          elevation: 0,
        ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0)  ,
              child: Card(
                child: ListTile(
                  onTap: (){
                  updateTime(index);
                  },
                    title:Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}
