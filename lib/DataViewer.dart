import 'package:flutter/material.dart';
import 'package:test_data_table/DataTableWidget.dart';

import 'SampleData.dart';

class DataViewerPage extends StatefulWidget {
  DataViewerPage({Key? key}) : super(key: key);

  @override
  State<DataViewerPage> createState() => _DataViewerPageState();
}

class _DataViewerPageState extends State<DataViewerPage> {
  SampleData sd = SampleData();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('>>>> 1111');
    sd.prepareSampleTransactions();
    print('>>>> 333  ${sd.transactions.length}');
    sd.getTransData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Table'),
      ),
      body: DataTableWidget([
        'Id',
        'Hall Id',
        'Owner Id',
        'User Id',
        'Rcpt #',
        'Book Dt',
        'Func Dt',
        'Func Name',
        'Shift',
        'Party Name',
        'Address',
        'Contact',
      ], sd.getTransData()),
    );
  }
}
