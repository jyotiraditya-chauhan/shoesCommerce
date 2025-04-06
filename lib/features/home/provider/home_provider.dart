import 'package:flutter/material.dart';
import 'package:shoes_app/core/shoes_model.dart';

class HomeProvider extends ChangeNotifier {
  List<ShoesModel> seletecdShoes = [];



  
  void addShoes(ShoesModel model) {
    seletecdShoes.add(model);
  
    notifyListeners();
  }

  void removeShoes(ShoesModel model) {
    seletecdShoes.remove(model);
  
    notifyListeners();
  }
}