import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ScheduleModel {
  int? set_id;
  String set_name;
  ScheduleModel({
    required this.set_id,
    required this.set_name,
  });

  ScheduleModel.insert({required this.set_name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'set_id': set_id,
      'set_name': set_name,
    };
  }

  factory ScheduleModel.fromMap(Map<String, dynamic> map) {
    return ScheduleModel(
      set_id: map['set_id'] != null ? map['set_id'] as int : null,
      set_name: map['set_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduleModel.fromJson(String source) => ScheduleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
