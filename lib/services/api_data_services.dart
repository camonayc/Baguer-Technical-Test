import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:technical_test_baguer/models/models.dart';

class DataService {
  Future<List<User>> fetchUser() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/?results=10&nat=ES'));

    if (response.statusCode == 200) {
      Data data = Data.fromMap(json.decode(response.body));
      List<User> dataUser = data.results;
      // log(dataUser.toJson());
      return dataUser;
    }else{
      throw Exception('Failed to load User');
    }
  }
}
