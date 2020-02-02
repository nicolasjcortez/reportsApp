import 'package:flutter/material.dart';
import 'package:reports_app/components/reportsListWidget.dart';
import 'package:reports_app/components/progress_indicator.dart';
import 'package:reports_app/model/report.dart';
import 'package:reports_app/service/reportsApi.dart';
import 'package:http/http.dart' as http;


class ReportsList extends StatefulWidget {
  ReportsList({Key key, this.title}) : super(key: key);
  final String title;
  @override
    _ReportsListState createState() => new _ReportsListState();
}

class _ReportsListState extends State<ReportsList> {
  final _api = ReportsApi();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: FutureBuilder<ReportsWrapper>(
        future: _api.fetchReports(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print('ERROR: ' + snapshot.error.toString());
          return snapshot.hasData
              ? ReportsListWidget(wrapper: snapshot.data)
              : ActivityIndicator();
        },
      ),
    );
  }
}