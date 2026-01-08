import 'package:flutter/material.dart';
import 'package:imc_calculator/model/history.dart';
import 'package:imc_calculator/repository/history_repository.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var historyRepository = HistoryRepository();
  var _historylist = <History>[];

  @override
  void initState() {
    super.initState();
    listHistory();
  }

  void listHistory() async {
    _historylist = await historyRepository.listHistory();
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
        itemCount: _historylist.length,
        itemBuilder: (BuildContext bc, int index) {
          var historyList = _historylist[index];
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
                key: Key(historyList.id),
                onDismissed: (direction) {
                  historyRepository.removeHistory(historyList);
                  setState(() {
                    _historylist.removeAt(index);
                    listHistory();
                  });
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
