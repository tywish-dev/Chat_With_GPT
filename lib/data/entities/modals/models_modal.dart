import 'package:flutter/material.dart';

class ModelsModal {
  final String id;
  final int created;
  final String root;

  ModelsModal({required this.id, required this.created, required this.root});

  factory ModelsModal.fromJson(Map<String, dynamic> json) =>
      ModelsModal(id: json['id'], created: json['created'], root: json['root']);

  static List<ModelsModal> modelsFromSnapshot(List modelSnapshot) {
    return modelSnapshot.map((data) => ModelsModal.fromJson(data)).toList();
  }
}
