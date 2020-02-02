import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:reports_app/model/report.dart';


class ReportContent extends StatelessWidget {

  final Report report;

  
  ReportContent({ this.report });

  @override
  Widget build(BuildContext context) =>
      report != null ? _buildContent(context) : _onError();


  Widget  _buildContent(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      padding: const EdgeInsets.all(32.0),
      child: _createTable()
    );
  }
   _createTable(){
    //Decode your json string
    //final String jsonSample='[{"id":1},{"id":2}]';
    var json = jsonDecode(report.reportJson);

    //Simply pass this json to JsonTable
    return JsonTable(json);
  
  }

  Widget _onError() {
    return Container();
  }
}
  /*Widget _buildContent(BuildContext context) {
    return Table(
      //defaultColumnWidth: FixedColumnWidth(150.0),
      border: TableBorder(
        horizontalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        verticalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      children: createTable(report),
    );
  }

  List createTable(Report report )
  {
    report.reportJson;
    List<TableRow> list = [
        _criarLinhaTable("vfnokeqmbkmeqbkmeqfbmeqklbmel, Time, Gols, 6536572754754735277"),
        _criarLinhaTable("25, Palmeiras,16 , .5362376537272"),
        _criarLinhaTable("20, Santos, 5, 5426356.5326723"),
        _criarLinhaTable("17, Flamento, 6, 2365236326"),
      ];
    return list;
  }

  _criarLinhaTable(String listaNomes) {
    return TableRow(
      children: listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(fontSize: 20.0),
          ),
          padding: EdgeInsets.all(8.0),
        );
      }).toList(),
    );
  }

  
}*/

