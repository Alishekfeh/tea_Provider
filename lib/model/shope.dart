import 'package:flutter/material.dart';
import 'package:tea/model/drink.dart';

class TeaShop extends ChangeNotifier {
  final List<Drink> _shop = [
    Drink(name: "Pearl Drink Tea", price: "4.00", imagePath: "lib/images/tea.png"),
    Drink(name: "Pearl Drink Tea", price: "4.00", imagePath: "lib/images/team.png"),
    Drink(name: "Pearl Drink Tea", price: "4.00", imagePath: "lib/images/tea.png"),
  ];
  final List<Drink> _userCart=[];
  List<Drink> get shop=>_shop;
  List<Drink> get cart=>_userCart;

  void addToCart(Drink drink){
    _userCart.add(drink);
    notifyListeners();
  }
  void removeToCart(Drink drink){
    _userCart.remove(drink);
    notifyListeners();
  }
}
