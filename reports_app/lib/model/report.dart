class Report {
  final String name;
  final String reportJson;

  Report({
    this.name,
    this.reportJson
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      name: json['name'],
      reportJson: json['reportJson']
    );
  }
}

class ReportsWrapper {
  final List<Report> reports;

  ReportsWrapper({ this.reports});

  factory ReportsWrapper.fromJson(List<dynamic> json) {
    List<Report> reportsList = json.map((item) => Report.fromJson(item)).toList();

    return new ReportsWrapper(
      reports: reportsList
    );
  }
}