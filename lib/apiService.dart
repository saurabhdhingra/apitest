import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/user_model.dart';

const apiKey =
    "0e023798f7f25e816cc260a0561741a4d079f01d9831287353da17b951b28191";

class NetworkHelper {
  List<UserModel> decodeUser(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<UserModel>((json) => UserModel.fromMap(json)).toList();
  }

  Future getUsers() async {
    http.Response response =
        await http.get(Uri.parse('https://gorest.co.in/public/v2/users'));

    if (response.statusCode == 200) {
      String data = response.body;

      return decodeUser(data);
    } else {
      print(response.statusCode);
    }
  }

  Future deleteUser(
    int id,
  ) async {
    http.Response response = await http.delete(
      Uri.parse('https://gorest.co.in/public/v2/users/' + id.toString()),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + apiKey,
      },
    );

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future createUser(
      String name, String email, String gender, String status) async {
    http.Response response = await http.post(
      Uri.parse('https://gorest.co.in/public/v2/users'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + apiKey,
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'gender': gender,
        'status': status,
      }),
    );

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future updateUser(
    int id,
    String name,
    String email,
    String gender,
    String status,
  ) async {
    http.Response response = await http.put(
      Uri.parse('https://gorest.co.in/public/v2/users/' + id.toString()),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + apiKey,
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'gender': gender,
        'status': status,
      }),
    );

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
