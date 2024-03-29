import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // Location name for ui
  String time; // time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      // make the request
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      // create a date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}

// WorldTime instance =
//     WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
