import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

List<String> siteNames;

class TableLayout extends StatefulWidget {
  @override
  _TableLayoutState createState() => _TableLayoutState();
}

class _TableLayoutState extends State<TableLayout> {
  List<List<dynamic>> _data = [];

  // This function is triggered when the floating button is pressed
  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/bp_demo_source.csv");
    List<List<dynamic>> _listData =
        CsvToListConverter(eol: "\n").convert(_rawData);
    // // Site Size
    // for (int i = 0; i < 20; i++) {
    //   print(data[i][11]);
    // }

    // // Site Name
    // for (int i = 0; i < 20; i++) {
    //   print(data[i][2]);
    // }
    setState(() {
      _data = _listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kindacode.com"),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (_, index) {
          return Card(
            margin: const EdgeInsets.all(3),
            color: index == 0 ? Colors.amber : Colors.white,
            child: ListTile(
              leading: Text(_data[index][2].toString()),
              title: Text(_data[index][3]),
              trailing: Text(_data[index][4].toString()),
            ),
          );
        },
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: _loadCSV),
    );
  }
}
