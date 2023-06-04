import 'package:flutter/material.dart';
import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'India', location: 'India', flag: 'india.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
