import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
    print(data);
    String bgImg=data['isDayTime'] ? "https://previews.123rf.com/images/julietta24/julietta241610/julietta24161000040/65042270-field-of-rye-and-sunny-day-vertical-background.jpg":"https://wallpapershome.com/images/pages/pic_v/17037.jpg";
    Color bgColor=data['isDayTime'] ? Colors.blue : Colors.indigo[700];
    Color textColor=data['isDayTime'] ? Colors.black : Colors.grey[300];
    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(child:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(bgImg),
            fit:BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                  onPressed: () async{
                    dynamic result=await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data={
                        'time':result['time'],
                        'location':result['location'],
                        'isDayTime':result['isDayTime'],
                        'flag':result['flag']
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location,color: Colors.grey[300],),
                  label: Text("Edit Location"),),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: textColor
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: textColor
                ),
              )
            ],
          ),
        ),
      ))
    );
  }
}
