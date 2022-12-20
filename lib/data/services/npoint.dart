import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/NpointModel.dart';

class Npoint {

  Future<NPointModel> getData()async{
    var response = await http.get(Uri.parse('https://api.npoint.io/16487b434327bb6c9468'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return NPointModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

}