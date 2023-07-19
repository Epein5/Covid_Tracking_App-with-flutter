import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/allmodel.dart';
import 'package:flutter_application_1/utils/apiurls.dart';
import 'package:http/http.dart' as http;

class StateServices {
  Future<all>fetchWorldRecords() async {
    final response = await http.get(Uri.parse(urls.worldStateurlcountrylist));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return all.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> fetchCountriesRecords() async {
    final response = await http.get(Uri.parse(urls.countrylist));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Error");
    }
  }
}
