import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:collection/collection.dart';
import 'SampleData.dart';

class ColumnInfo {
  final String label;
  final String name;
  final double? width;
  final Type type;

  ColumnInfo(this.label, this.name, this.width, this.type);
}

class DataTableWidget extends StatefulWidget {
  final List<ColumnInfo> columnInfos;
  final List<Map<String, dynamic>> data;
  final MaterialStateProperty<Color?> headerBk;

  DataTableWidget(
    this.columnInfos,
    this.data,
    this.headerBk, {
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
        // height: 450,
        // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 0,
              child: IconTheme(
                data: IconThemeData(color: Colors.black, opacity: 1,size:0),
                child: DataTable(
                    sortAscending: sortAscending,
                    sortColumnIndex: sortColumnIndex,
                    columnSpacing: 0,
                    headingRowHeight: 40,headingRowColor: widget.headerBk,
                    dataRowHeight: 0,
                    columns: widget.columnInfos
                        .map(
                          (c) => DataColumn(
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                sortColumnIndex = columnIndex;
                                sortAscending = ascending;
                                widget.data.sort((a, b) {
                                  dynamic avalue = a[c.name];
                                  dynamic bvalue = b[c.name];
                                  if (avalue is String) {
                                    avalue = avalue.toString().toLowerCase();
                                    bvalue = bvalue.toString().toLowerCase();
                                  }
                                  return ((ascending) ? avalue.compareTo(bvalue) : bvalue.compareTo(avalue));
                                });
                              });
                              print('>>>> $columnIndex, $ascending');
                            },
                            label: Text(c.label), numeric: c.type==int ? true:false,
                          ),
                        )
                        .toList(),
                    rows: [
                      DataRow(
                        cells: widget.data[0].entries.toList().map((map) {
                          double width = widget.columnInfos.firstWhere((element) => element.name == map.key).width ?? 0;
                          return DataCell(
                            Container(
                              width: width,
                              child: Text(
                                map.value.toString(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ]),
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: IconTheme(
                  data: IconThemeData(color: Colors.purple, opacity: 0,size: 0),
                  child: DataTable(
                    sortAscending: sortAscending,
                    sortColumnIndex: sortColumnIndex,showCheckboxColumn: false,
                    columnSpacing: 0,
                    headingRowHeight: 0,
                    columns: widget.columnInfos
                        .map(
                          (c) => DataColumn(
                            onSort: (columnIndex, ascending) {
                              // setState(() {
                              //   sortColumnIndex = columnIndex;
                              //   sortAscending = ascending;
                              //   widget.data.sort((a, b) {
                              //     dynamic avalue = a[c.name];
                              //     dynamic bvalue = b[c.name];
                              //     if (avalue is String) {
                              //       avalue = avalue.toString().toLowerCase();
                              //       bvalue = bvalue.toString().toLowerCase();
                              //     }
                              //     return ((ascending) ? avalue.compareTo(bvalue) : bvalue.compareTo(avalue));
                              //   });
                              // });
                              // print('>>>> $columnIndex, $ascending');
                            },
                            label: Text(c.label),numeric: c.type==int ? true:false,
                          ),
                        )
                        .toList(),
                    rows: widget.data
                        .map(
                          (m) => DataRow(onSelectChanged: (changed){},
                              cells: m.entries.toList().map((map) {
                            double width =
                                widget.columnInfos.firstWhere((element) => element.name == map.key).width ?? 0;
                            Type type = widget.columnInfos.firstWhere((element) => element.name == map.key).type;
                            return DataCell(
                              Container(
                                width: width,
                                child: Text(
                                  map.value.toString(),textAlign: type==int ? TextAlign.end:TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            );
                          }).toList()),
                        )
                        .toList(),
                  ),
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
