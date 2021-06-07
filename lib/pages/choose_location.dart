import 'package:flutter/material.dart';
import 'package:time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations=[
    WorldTime(url: 'Europe/London',location: 'London',flag: 'https://cdn.britannica.com/44/344-004-494CC2E8/Flag-England.jpg'),
    WorldTime(url: 'Europe/Berlin',location: 'Berlin',flag: 'https://cdn.britannica.com/97/897-004-232BDF01/Flag-Germany.jpg'),
    WorldTime(url: 'Africa/Cairo',location: 'Cairo',flag: 'https://cdn.britannica.com/85/185-050-6A8E2E8A/Flag-Egypt.jpg'),
    WorldTime(url: 'Africa/Nairobi',location: 'Nairobi',flag: 'https://cdn.britannica.com/200x500/15/15-050-B075588A/Flag-Kenya.jpg'),
    WorldTime(url: 'America/Chicago',location: 'Chicago',flag: 'https://cdn.britannica.com/79/4479-050-6EF87027/flag-Stars-and-Stripes-May-1-1795.jpg'),
    WorldTime(url: 'America/New_York',location: 'New York',flag: 'https://cdn.britannica.com/79/4479-050-6EF87027/flag-Stars-and-Stripes-May-1-1795.jpg'),
    WorldTime(url: 'Asia/Kolkata',location: 'Kolkata',flag: 'https://cdn.britannica.com/200x500/97/1597-050-008F30FA/Flag-India.jpg'),

    WorldTime(url: 'Asia/Seoul',location: 'Seoul',flag: 'https://cdn.britannica.com/49/1949-004-8818300C/Flag-South-Korea.jpg'),


  ];

  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime
    });

  }

  @override
  Widget build(BuildContext context) {
    print("build ran");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  print(locations[index].location);
                  updateTime(index);
                  // Navigator.pushReplacementNamed(context, '/');
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("${locations[index].flag}"),
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}
