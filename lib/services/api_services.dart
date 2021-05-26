import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._instantiate();
  static final ApiService instance = ApiService._instantiate();

  final String _baseURL = 'api.spoonacular.com';
  static const String API_KEY = 'f4237d48391548d0a0e9091e173c485f';
}

//final String RAPID_API_KEY = "3fc60d8f1a2b4f93a7f165ca0f5727a1";
//backup "f4237d48391548d0a0e9091e173c485f "