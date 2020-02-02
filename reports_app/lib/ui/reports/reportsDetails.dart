import 'package:flutter/material.dart';
import 'package:reports_app/components/reportContent.dart';
import 'package:reports_app/model/report.dart';


class ReportDetails extends StatefulWidget {
  ReportDetails({ Key key, this.title, this.report }) : super(key: key);
  final String title;
  final Report report;
  _ReportDetailsState createState() => _ReportDetailsState();
}
class _ReportDetailsState extends State<ReportDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ReportContent(report: widget.report),
      );
  }
}