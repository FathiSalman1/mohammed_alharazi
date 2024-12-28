import 'package:flutter/material.dart';
import 'package:mohammed_alharazi/Models/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductController with ChangeNotifier {
  List<Product> _products = [];
  Product _product = Product(
    name: '',
    price: 0.0,
    discount: 0.0,
    isChecked1: false,
    isChecked2: false,
    quantity: 0,
  );

  List<Product> get products => _products;

  Product get product => _product;

  // لتحميل البيانات من SharedPreferences
  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Load your product list from SharedPreferences
    // Update _products list based on the loaded data
    notifyListeners();
  }

  // لحفظ البيانات في SharedPreferences
  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Save your product list to SharedPreferences
  }

  // لإضافة صنف جديد إلى القائمة
  void addProduct(Product product) {
    _products.add(product);
    saveData();
    notifyListeners();
  }

  // لحذف صنف من القائمة
  void removeProduct(int index) {
    _products.removeAt(index);
    saveData();
    notifyListeners();
  }

  // لتحديث قيم الصنف
  void updateName(String name) {
    _product.name = name;
    notifyListeners();
  }

  void updatePrice(double price) {
    _product.price = price;
    notifyListeners();
  }

  void updateDiscount(double discount) {
    _product.discount = discount;
    notifyListeners();
  }

  void updateCheckbox1(bool value) {
    _product.isChecked1 = value;
    saveData();
    notifyListeners();
  }

  void updateCheckbox2(bool value) {
    _product.isChecked2 = value;
    saveData();
    notifyListeners();
  }

  void updateQuantity(int quantity) {
    _product.quantity = quantity;
    saveData();
    notifyListeners();
  }

  // لإضافة المنتج الحالي إلى القائمة
  void saveCurrentProduct() {
    _products.add(Product(
      name: _product.name,
      price: _product.price,
      discount: _product.discount,
      isChecked1: _product.isChecked1,
      isChecked2: _product.isChecked2,
      quantity: _product.quantity,
    ));
    saveData();
    notifyListeners();
  }
}
