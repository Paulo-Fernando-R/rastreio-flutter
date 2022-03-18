import 'dart:convert';
import 'package:http/http.dart' as http;
 class TrackApi
{
  static Future<Map> track(codigo) async
  {
    var json;

    try
    {
      var url = 'https://api.linketrack.com/track/json?user=teste&token=1abcd00b' +
      '2731640e886fb41a8a9671ad1434c599dbaa0a0de9a5aa619f29a83f&codigo=' + 
      '${codigo}';

      var response = await http.get(url);
      json = jsonDecode(response.body);
    }
    catch(e)
    {}
    
    return json;
  }
}