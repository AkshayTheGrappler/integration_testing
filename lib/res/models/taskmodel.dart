

import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  TaskModel({
    this.task,
  });

  String task;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    task: json["task"],
  );

  Map<String, dynamic> toJson() => {
    "task": task,
  };
}
