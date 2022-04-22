import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'SampleData.dart';

class DataTableWidget extends StatefulWidget {
  final List<String> columns;
  final List<Map<String, dynamic>> data;

  DataTableWidget(
    this.columns,
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  State<DataTableWidget> createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  ScrollController sc = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sc.addListener(() {
      print('scrolling ....');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 200,
        width: 700,
        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 0,
              child: Container(
                width: 500,
                // decoration: BoxDecoration(color: Colors.lightBlue),
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith(
                    (states) {
                      return Colors.lightGreenAccent;
                    },
                  ),
                  // decoration: BoxDecoration(color: Colors.purpleAccent),
                  columns: widget.columns.map((e) => DataColumn(label: Text(e))).toList(),
                  rows: [],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  headingRowHeight: 0,
                  columns: widget.columns.map((e) => DataColumn(label: Text(e))).toList(),
                  rows: widget.data
                      .map(
                        (m) => DataRow(
                            cells: m.entries.toList().map((map) => DataCell(Text(map.value.toString()))).toList()),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    //   Column(
    //   children: [
    //     DataTable(
    //       columns: widget.columns.map((e) => DataColumn(label: Text(e))).toList(),
    //       rows: [],
    //     ),
    //     Expanded(
    //       child: Scrollable(
    //         controller: ScrollController(), axisDirection: AxisDirection.right,
    //         viewportBuilder: (BuildContext context, ViewportOffset position) {
    //           return Container(
    //             width: 600,
    //             height: 200,
    //             decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 3)),
    //           );
    //         },
    //       ),
    //     ),
    //     // child: DataTable(
    //     //   headingRowHeight: 0,
    //     //   columns: widget.columns.map((e) => DataColumn(label: Text(e))).toList(),
    //     //   rows: widget.data
    //     //       .map(
    //     //         (m) => DataRow(cells: m.entries.toList().map((map) => DataCell(Text(map.value.toString()))).toList()),
    //     //   )
    //     //       .toList(),
    //     // ),
    //
    //   ],
    // );
  }
}

// child: DataTable(
// headingRowHeight: 0,
// columns: widget.columns.map((e) => DataColumn(label: Text(e))).toList(),
// rows: widget.data
//     .map(
// (m) => DataRow(cells: m.entries.toList().map((map) => DataCell(Text(map.value.toString()))).toList()),
// )
// .toList(),
