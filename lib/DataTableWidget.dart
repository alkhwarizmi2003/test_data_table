import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:collection/collection.dart';
import 'SampleData.dart';

class ColumnInfo{
  final String lable;
  final String name;
  final int width;
  final Type type ;

  ColumnInfo(this.lable, this.name,this.width, this.type);
}

class DataTableWidget extends StatefulWidget {
  final List<ColumnInfo> columnInfos;
  final List<String> columns;
  final List<Map<String, dynamic>> data;

  DataTableWidget(
      this.columnInfos,
    this.columns,
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  State<DataTableWidget> createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  ScrollController sc = ScrollController();
  bool sortAscending = false;
  int sortColumnIndex = 0;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 450,
        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 0,
              child: DataTable(
                columnSpacing: 0,
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) {
                    return Colors.lightGreenAccent;
                  },
                ),
                // decoration: BoxDecoration(color: Colors.purpleAccent),
                columns: widget.columns
                    .map(
                      (e) => DataColumn(
                        label: Text(e),
                      ),
                    )
                    .toList(),
                rows: [
                  DataRow(cells: [
                    DataCell(
                      Container(
                        width: 80,
                        child: Text('ert'),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 80,
                        child: Text('ert'),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 80,
                        child: Text('ert'),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 80,
                        child: Text('ert'),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 80,
                        child: Text('ert'),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 80,
                        child: Text('ert'),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 80,
                        child: Text('ert'),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 80,
                        child: Text('ert'),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 80,
                        child: Text('ert'),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 80,
                        child: Text('ert'),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 80,
                        child: Text('ert'),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 80,
                        child: Text('ert'),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  sortAscending: sortAscending,
                  sortColumnIndex: sortColumnIndex,
                  columnSpacing: 0,
                  headingRowHeight: 40,
                  columns: widget.columns
                      .map(
                        (e) => DataColumn(
                          onSort: (columnIndex, ascending) {
                            setState(() {
                              sortColumnIndex = columnIndex;
                              sortAscending = ascending;
                            });
                            print('>>>> $columnIndex, $ascending');
                          },
                          label: Text(e),
                        ),
                      )
                      .toList(),
                  rows: widget.data
                      .map(
                        (m) => DataRow(
                            cells: m.entries
                                .toList()
                                .map((map) => DataCell(Container(width: 80, child: Text(map.value.toString()))))
                                .toList()),
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
