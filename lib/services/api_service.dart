import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/device_model.dart';
import '../models/tenant_model.dart';

class ApiService {
  Future<List<Tenant>> fetchTenants() async {
    final response = await http.get(Uri.parse(
        'https://us-central1-splitmatealpha.cloudfunctions.net/process-device-data')); // Replace with your actual API endpoint
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((json) => Tenant.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tenants');
    }
  }
}
