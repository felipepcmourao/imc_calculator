import 'package:imc_calculator/model/history.dart';

class HistoryRepository {
  static final HistoryRepository _instance = HistoryRepository._internal();

  factory HistoryRepository() {
    return _instance;
  }

  HistoryRepository._internal();

  final List<History> _historyList = [];

  Future<List<History>> listHistory() async {
    await Future.delayed(Duration(milliseconds: 100));
    return _historyList;
  }

  Future<void> addHistory(History history) async {
    await Future.delayed(Duration(milliseconds: 100));
    _historyList.add(history);
  }

  Future<void> removeHistory(History history) async {
    await Future.delayed(Duration(milliseconds: 100));
    _historyList.remove(history);
  }
}
