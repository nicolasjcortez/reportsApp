import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reports_app/model/report.dart';


class ReportsApi {

  static final String _baseUrl = "https://reportapi-ba.azurewebsites.net/api/";

  Future<ReportsWrapper> fetchReports(http.Client client) async {
    final response = await client.get(_baseUrl + 'Reports');
    return _parseReports(response.body);
  }

  ReportsWrapper _parseReports(String responseBody){
    final parsed = json.decode(responseBody);
    return ReportsWrapper.fromJson(parsed);
  }

}