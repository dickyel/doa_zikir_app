import 'package:flutter/material.dart';
import 'package:doa_zikir_app/models/doa_models.dart';

import '../services/doa_service.dart';


class DoaProvider with ChangeNotifier {
  List<DoaModel> _doas = [];
  List<DoaModel> get doas => _doas;

  set doas(List<DoaModel> doas){
    _doas = doas;
    notifyListeners();

  }

  Future<void> getDoas() async {
    try {
      List<DoaModel> doas = await DoaService().getDoas();
      _doas = doas;
      print('Number of doas: ${_doas.length}');
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  
}