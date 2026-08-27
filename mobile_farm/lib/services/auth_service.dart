import 'package:flutter/material.dart';
import 'api_service.dart';


class AuthService extends ChangeNotifier{
  
  UserModel? currentUser;
  String? _token;
  String? _lastError;
  String? get token => _token;
  String? get lastError => _lastError;
  UserModel? get user => currentUser;
  bool get isLoggedIn => token != null;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final ApiService apiService = ApiService();

   Future<bool> login(String email, String password) async{
    _isLoading = true;
    _lastError = null;
    try {
      final response = await apiService.post(
        "/login",
        {
          "email": email,
          "password": password,
        },
      );
      _token = response["token"];
      currentUser = UserModel.fromJson(response["user"]);
      _isLoading = false;
      notifyListeners();
      return true;

    } on ApiException catch (e) {
      _lastError = e.message;
      return false;
    } catch (e) {
      _lastError = 'Login failed. Please try again.';
      return false;
    }finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  Future<void> logout() async {
    try {
      if (_token != null) {
        await apiService.post('/logout', {}, token: _token);
      }
    } finally {
      currentUser = null;
      _token = null;
      notifyListeners();
    }
  }

  Future<bool> register(Map<String, dynamic> data) async{
    _isLoading = true;
    _lastError = null;

    try {
      final response = await apiService.post( "/register", data, );
      _token = response["token"];
      currentUser = UserModel.fromJson(response["user"]);
      _isLoading = false;
      notifyListeners();

      return true;

    } on ApiException catch (e) {
      _lastError = e.message;
      return false;
    } catch (e) {
      _lastError = 'Registration failed. Check your details and try again.';
      return false;
    }finally {
      _isLoading = false;
      notifyListeners();
    }

  }

}

//models
class UserModel {
  final int id;
  final String lastName;
  final String firstName;
  final String email;
  final String password;
  final String phone;
  final String location;
  final String address;

  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.location,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      firstName: json["firstname"]?? "",
      lastName: json["lastname"] ?? "",
      email: json["email"] ?? "",
      password: "",
      phone: json["phone"] ?? "",
      location: json["location"] ?? "",
      address: json["address"] ?? "",
    );
  }
}