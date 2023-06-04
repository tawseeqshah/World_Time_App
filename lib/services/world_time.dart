import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location = " ";
  String time = " ";
  String flag = " ";
  String url = " ";
  bool isDayTime = true;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    var city = this.url;
    Uri url = Uri.parse('https://api.api-ninjas.com/v1/worldtime?city=$city');
    Map<String, String> headers = {
      'X-Api-Key': 'IOWjCLM8fRqD6YmEB+d3oQ==it39Dpdh8nG3B5Wl',
      'Content-Type': 'application/json',
    };

    try {
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> result = jsonDecode(response.body);
        // print(result);
        String datetime = (result['datetime']);
        DateTime now = DateTime.parse(datetime);

        isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

        time = DateFormat.jm().format(now);
      } else {
        print('Error: ${response.statusCode}');
        time = 'Could Not get Time data';
      }
    } catch (error) {
      print('Error: $error');
      time = 'Could Not get Time data';
    }
  }
}
