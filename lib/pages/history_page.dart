import 'package:flutter/material.dart';
import 'package:imc_calculator/model/history_sqlite_model.dart';
import 'package:imc_calculator/repository/history_sqlite_repository.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  HistorySqliteRepository historySqliteRepository = HistorySqliteRepository();
  var _historySqlite = <HistorySqliteModel>[];

  @override
  void initState() {
    super.initState();
    listHistorySqlite();
  }

  void listHistorySqlite() async {
    _historySqlite = await historySqliteRepository.getData();
    setState(() {});
  }

  String formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/"
        "${date.month.toString().padLeft(2, '0')}/"
        "${date.year} - "
        "${date.hour.toString().padLeft(2, '0')}:"
        "${date.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Histórico de medições")),
      body: ListView.builder(
        itemCount: _historySqlite.length,
        itemBuilder: (BuildContext bc, int index) {
          var historyList = _historySqlite[index];
          return Column(
            children: [
              Dismissible(
                direction: DismissDirection.endToStart,
                background: Container(
                  color: const Color.fromARGB(255, 150, 19, 9),
                  child: Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                key: ValueKey(historyList.id ?? index),
                onDismissed: (direction) async {
                  if (historyList.id != null) {
                    await historySqliteRepository.remove(historyList.id!);
                  }
                  listHistorySqlite();
                },

                child: ListTile(
                  title: Text(historyList.calculatedIMC),
                  subtitle: Text(formatDate(historyList.date)),
                ),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
