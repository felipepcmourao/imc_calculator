class HistorySqliteModel {
  final int? id;
  String calculatedIMC;
  DateTime date;

  HistorySqliteModel({
    this.id,
    required this.calculatedIMC,
    required this.date,
  });

  factory HistorySqliteModel.fromMap(Map<String, dynamic> map) {
    return HistorySqliteModel(
      id: map['id'] is int
          ? map['id'] as int
          : int.tryParse(map['id'].toString()),
      calculatedIMC: map['calculatedIMC']?.toString() ?? '',
      date: DateTime.parse(map['date'].toString()),
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'calculatedIMC': calculatedIMC,
      'date': date.toIso8601String(),
    };
    if (id != null) map['id'] = id;
    return map;
  }
}
