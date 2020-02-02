import 'package:flutter/material.dart';
import 'package:reports_app/model/report.dart';
import 'package:reports_app/ui/reports/reportsDetails.dart';

class ReportsListCell extends StatelessWidget {
  final List<Report> reports;
  final int index;
  ReportsListCell({this.reports, this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(reports[index].name),
          onTap: () {
            Navigator.push(context,
                _onTap(reports[index].name, context, reports[index]));
          },
        ),
        Divider(),
      ],
    );
  }
  _onTap(String title, BuildContext context, Report report) {
    return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
            ReportDetails(
              title: title,
              report: report,
            ))
    );
  }
}