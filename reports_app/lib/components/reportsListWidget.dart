import 'package:flutter/material.dart';
import 'package:reports_app/components/reportListCell.dart';
import 'package:reports_app/model/report.dart';


class ReportsListWidget extends StatelessWidget {
  final ReportsWrapper wrapper;
  ReportsListWidget({Key key, this.wrapper}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: wrapper.reports.length,
        itemBuilder: (context, index) {
          return ReportsListCell(reports: wrapper.reports, index: index);
        });
  }
}