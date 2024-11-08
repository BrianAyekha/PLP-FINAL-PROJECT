import 'package:flutter/material.dart';

class ViewReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Report> reports = _fetchReports();

    return Scaffold(
      appBar: AppBar(
        title: const Text('View Reports'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          return _buildReportTile(reports[index]);
        },
      ),
    );
  }

  List<Report> _fetchReports() {
    // Replace with actual data fetching logic
    return [
      Report(description: 'Pothole in Main St.', category: 'Roads', severity: 'High'),
      Report(description: 'Bridge crack', category: 'Bridges', severity: 'Medium'),
    ];
  }

  Widget _buildReportTile(Report report) {
    Color severityColor;

    switch (report.severity) {
      case 'High':
        severityColor = Colors.red;
        break;
      case 'Medium':
        severityColor = Colors.orange;
        break;
      case 'Low':
        severityColor = Colors.green;
        break;
      default:
        severityColor = Colors.grey;
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4,
      child: ListTile(
        leading: Icon(Icons.report_problem, color: severityColor),
        title: Text(
          report.description,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(
          '${report.category} - Severity: ${report.severity}',
          style: TextStyle(color: Colors.grey[600]),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal),
        contentPadding: const EdgeInsets.all(16.0),
        onTap: () {
          // Handle tile tap if needed
        },
      ),
    );
  }
}

class Report {
  final String description;
  final String category;
  final String severity;

  Report({required this.description, required this.category, required this.severity});
}