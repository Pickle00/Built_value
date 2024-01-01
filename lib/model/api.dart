import 'dart:async';
import 'dart:convert';

import 'package:myapp/model/built_vehicle.dart';
import 'package:myapp/model/serializers.dart';
import 'package:http/http.dart' as http;

const String url = 'https://jsonplaceholder.typicode.com/users';

Future<List<UserDetail?>> fetchData() async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final List<dynamic> responsedata = jsonDecode(response.body);

    List<UserDetail?> userDetailList = responsedata
        .map(
          (responsedata) =>
              serializers.deserializeWith(UserDetail.serializer, responsedata),
        )
        .toList();
    print(userDetailList);
    return userDetailList;
  } else {
    throw Exception('Error: Something went wrong');
  }
}

void main() {
  fetchData();
}
