import 'package:flutter/material.dart';

class MovieResourcesTable extends StatelessWidget {
  const MovieResourcesTable({
    super.key,
    required this.labels,
    required this.rows,
  });

  final List<String> labels;
  final List<DataRow> rows;

  @override
  Widget build(BuildContext context) {
    final columns = labels.map((label) {
      return DataColumn(
        label: Expanded(child: Text(label)),
      );
    }).toList();

    return Container(
      padding: const EdgeInsets.all(10),
      child: DataTable(
        columns: columns,
        rows: rows,
      ),
    );
    ;
  }
}
