import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  List<dynamic> _employees = [];
  @override
  void initState() {
    super.initState();
    _fetchEmployees();
  }

  Future<void> _fetchEmployees() async {
    final response = await http.get(Uri.parse('http://localhost:5000/emp'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);
      setState(() {
        _employees = jsonData;
      });
    } else {
      throw Exception('Failed to load employees');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Job')),
            // DataColumn(label: Text('Hire Date')),
            //DataColumn(label: Text('Salary')),
          ],
          rows: _employees
              .map((employee) => DataRow(
                    cells: [
                      DataCell(Text('${employee['empno']}')),
                      DataCell(Text('${employee['ename']}')),
                      DataCell(Text('${employee['job']}')),
                      //DataCell(Text('${employee['HIREDATE']}')),
                      // DataCell(Text('${employee['SAL']}')),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
