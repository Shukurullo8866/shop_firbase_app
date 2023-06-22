// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../../../data/model/product_model.dart';

class BeautifulTable extends StatelessWidget {
  final List<DataRow> rows;

  const BeautifulTable({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(
            label: Text('ID'),
          ),
          DataColumn(
            label: Text('Nomi'),
          ),
          DataColumn(
            label: Text('Tavsifi'),
          ),
        ],
        rows: rows,
      ),
    );
  }
}

class InfoPage2 extends StatefulWidget {
  const InfoPage2({Key? key, required this.getData}) : super(key: key);
  final ProductModel getData;
  @override
  _InfoPage2State createState() => _InfoPage2State();
}
class _InfoPage2State extends State<InfoPage2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 29),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: BeautifulTable(
                          rows: List.generate(
                            250,
                            (index) => DataRow(
                              cells: [
                                DataCell(Text('ID $index')),
                                DataCell(Text('Nomi $index')),
                                DataCell(Text('Tavsifi $index')),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
