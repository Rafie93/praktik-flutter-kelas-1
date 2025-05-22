import 'dart:convert';

import 'package:flutter_application_1a/model/DaftarResponse.dart';
import 'package:http/http.dart' as http;

class Registerrequest {
  static Future<DaftarResponse> kirimDataKeAPI(
      String nama, String pekerjaan) async {
    var url = Uri.parse('https://reqres.in/api/users');
    var result = await http.post(url, body: {
      'name': nama,
      'job': pekerjaan,
    });

    var jsonData = json.decode(result.body);
    return DaftarResponse.createDaftarResponse(jsonData);
  }
}
