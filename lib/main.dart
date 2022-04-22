import 'package:flutter/material.dart';
import 'package:test_data_table/DataTableWidget.dart';
import 'package:test_data_table/SampleData.dart';

import 'DataViewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<DataCell> cells = [
      DataCell(Text('afd d')),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('App Title'),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>DataViewerPage()));
      },
      tooltip: 'Tool tip',
      child: Icon(Icons.add),
      ),

    );
  }
}
