import 'dart:convert';

import 'package:http/http.dart' as http;

class GoogleGeocodingService {
  final String _apiURL = 'https://maps.googleapis.com/maps/api/geocode/json';
  final String _apiKey = 'AIzaSyCGCE_BKLgLgV15Z3--kkzOhQygEjVi-A8';

  Future<List<String>> getLocationOptionsFromCoords(
      double lat, double lng) async {
    String finalUrl = "$_apiURL?latlng=$lat,$lng&key=$_apiKey";
    var resp;

    print(finalUrl);

    resp = await http.get(finalUrl);

    if (resp.statusCode == 200) {
      Map<String, dynamic> responseJson = json.decode(resp.body);

      if (responseJson["status"] == "OK") {
        List results = responseJson["results"];

        List<String> options = results
            .map((result) => result["formatted_address"])
            .cast<String>()
            .toList();

        return options;
      } else {
        print("Response error message: ${resp["error_message"]}");
      }
    }

    return [];
  }

  // Future<Point> getCoordsFromAddress() async {
  //   String finalUrl = "$_apiURL?latlng=$lat,$lng&key=$_apiKey";
  //   var resp;

  //   print(finalUrl);

  //   resp = await http.get(finalUrl);

  //   if (resp.statusCode == 200) {
  //     Map<String, dynamic> responseJson = json.decode(resp.body);

  //     if (responseJson["status"] == "OK") {
  //       List results = responseJson["results"];

  //       List<String> options = results
  //           .map((result) => result["formatted_address"])
  //           .cast<String>()
  //           .toList();

  //       return options;
  //     } else {
  //       print("Response error message: ${resp["error_message"]}");
  //     }
  //   }

  //   return [];
  // }
}
