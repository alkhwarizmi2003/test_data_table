import 'package:flutter/material.dart';
import 'package:test_data_table/DataTableWidget.dart';
import 'package:collection/collection.dart';

import 'SampleData.dart';

class DataViewerPage extends StatefulWidget {
  DataViewerPage({Key? key}) : super(key: key);

  @override
  State<DataViewerPage> createState() => _DataViewerPageState();
}

class _DataViewerPageState extends State<DataViewerPage> {
  SampleData sd = SampleData();
  List<ColumnInfo> colInfos=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('>>>> 1111');
    sd.prepareSampleTransactions();
    print('>>>> 333  ${sd.transactions.length}');
    sd.getTransData();

     colInfos = [
      ColumnInfo('ID', 'trans_id', 20),
       ColumnInfo('Hall Id', 'hall_id', 20),
       ColumnInfo('Owner Id', 'owner_id', 20),
       ColumnInfo('User Id', 'user_id', 20),
       ColumnInfo('Rcpt #', 'receipt_no', 20),
       ColumnInfo('Book Dt', 'book_date', 20),
       ColumnInfo('Func Dt', 'function_date', 20),
       ColumnInfo('Func Name', 'function_name', 20),
       ColumnInfo('Shift', 'function_shift', 20),
       ColumnInfo('Party Name', 'party_name', 20),
       ColumnInfo('Address', 'party_address', 20),
       ColumnInfo('Contact', 'party_contact', 20),
    ];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Table'),
      ),
      body: DataTableWidget(colInfos, [
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List<Iterable<TmpObj>> list = sd
              .getTransData()
              .map((e) => e.entries
                  .toList()
                  .mapIndexed((index, element) => TmpObj(index.toString(), element.key, element.value.toString())))
              .toList();

          Iterable<TmpObj> list2 = sd
              .getTransData()[0]
              .entries
              .toList()
              .mapIndexed((index, element) => TmpObj(index.toString(), element.key, element.value.toString()));

          list2.forEach((item) {
            print('>>>>>>>>>>> ${item}');
          });
        },
        tooltip: 'Tool tip',
        child: Icon(Icons.add),
      ),
    );
  }
}

class TmpObj {
  final String str1;
  final String str2;
  final String str3;

  TmpObj(this.str1, this.str2, this.str3);

  @override
  String toString() {
    // TODO: implement toString
    return '--- $str2 ';
  }
}
