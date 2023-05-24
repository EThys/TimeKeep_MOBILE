import 'dart:convert';

AbsenceModel absenceModelFromJson(String str) => AbsenceModel.fromJson(json.decode(str));

String absenceModelToJson(AbsenceModel data) => json.encode(data.toJson());

class AbsenceModel {
  AbsenceModel({
    this.id,
    this.motif,
    this.date_absence,
    this.user_id,
    this.status,
    this.data,
  });

  int? id;
  String? motif;
  String? date_absence;
  int? user_id;
  String? status;
  var data;

  factory AbsenceModel.fromJson(Map json) => AbsenceModel(

    id: json["id"],
    motif: json["motif"],
    date_absence: json["date_absence"],
    user_id: json["user_id"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "motif": motif,
    "date_absence": date_absence,
    "user_id": user_id,
    "status": status,
  };
}
