import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._instantiate();
  static final ApiService instance = ApiService._instantiate();

  final String _baseURL = 'api.spoonacular.com';
  static const String API_KEY = '3fc60d8f1a2b4f93a7f165ca0f5727a1';
}

//final String RAPID_API_KEY = "3fc60d8f1a2b4f93a7f165ca0f5727a1";
