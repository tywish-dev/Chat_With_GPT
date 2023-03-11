import '/data/entities/modals/models_modal.dart';
import '/data/entities/services/api_service.dart';
import '/data/repository/models_repository.dart';
import 'package:flutter/material.dart';

class ModelsProvider with ChangeNotifier {
  List<ModelsModal> _modelsList = [];
  String _currentModel = "gpt-3.5-turbo";

  List<ModelsModal> get getModelsList => _modelsList;
  String get getCurrentModel => _currentModel;

  var modelsRepo = ModelsRepository();

  void setCurrentModel(String model) {
    _currentModel = modelsRepo.setCurrentModel(model);
    notifyListeners();
  }

  Future<List<ModelsModal>> getAllModels() async {
    _modelsList = await ApiService.getModels();
    return _modelsList;
  }
}
