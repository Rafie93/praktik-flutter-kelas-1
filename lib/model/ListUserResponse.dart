import 'dart:convert';
import 'package:http/http.dart' as http;

class ListuserResponse {
  String id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  ListuserResponse({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  static Future<List<ListuserResponse>> getData(String page) async {
    var url = Uri.parse('https://reqres.in/api/users?page=$page');
    var result = await http.get(url);
    var jsonData = json.decode(result.body);
    List<dynamic> listUser = (jsonData as Map<String, dynamic>)['data'];
    List<ListuserResponse> users = [];
    for (int i = 0; i < listUser.length; i++) {
      users.add(ListuserResponse.createListuserResponse(listUser[i]));
    }
    return users;
  }

  factory ListuserResponse.createListuserResponse(
      Map<String, dynamic> jsonData) {
    return ListuserResponse(
      id: jsonData['id'].toString(),
      email: jsonData['email'],
      firstName: jsonData['first_name'],
      lastName: jsonData['last_name'],
      avatar: jsonData['avatar'],
    );
  }
}
