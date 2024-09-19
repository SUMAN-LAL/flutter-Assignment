import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
import 'user_model.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchUsers() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _users = data.map((json) => User.fromJson(json)).toList();
      } else {
        _errorMessage = "Failed to load users";
      }
    } catch (e) {
      _errorMessage = "An error occurred: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void refreshUsers() {
    fetchUsers();
  }
}
