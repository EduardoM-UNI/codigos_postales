import 'dart:convert';

import 'package:codigos_postales/models/postal_codes.dart';
import 'package:codigos_postales/utils/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostalCodeService {
  Future<PostalCodes> fechData(String postalCode, String city) async {
    var urlString = "";

    if (postalCode.isNotEmpty) urlString = AppUrls.urlCp + postalCode;
    if (city.isNotEmpty) urlString = AppUrls.urlCity + city;

    http.Response response = await http.get(Uri.parse(urlString));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonObject = json.decode(response.body);
      debugPrint(jsonObject["country"]);
      return postalCodesFromJson(response.body);
    } else {
      throw Exception('Error al cargar los datos');
    }
  }
}
