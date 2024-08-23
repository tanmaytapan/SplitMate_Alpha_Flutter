import 'package:flutter/material.dart';
import '../models/device_model.dart';
import '../models/tenant_model.dart';
import '../services/api_service.dart';

import '../services/api_service.dart'; // Make sure to import the ApiService

class TenantDeviceProvider extends ChangeNotifier {
  final ApiService apiService = ApiService(); // Initialize the API service
  List<Tenant> tenants = [];

  void addTenant(Tenant tenant) {
    tenants.add(tenant);
    notifyListeners();
  }

  void addDeviceToTenant(String tenantId, Device device) {
    final tenant = tenants.firstWhere((t) => t.id == tenantId);
    tenant.devices.add(device);
    notifyListeners();
  }

  void updateTenantData(Map<String, dynamic> data) {
    // Your logic to update tenants and devices
    notifyListeners();
  }

  void removeDeviceFromTenant(String tenantId, String deviceId) {
    final tenant = tenants.firstWhere((t) => t.id == tenantId);
    tenant.devices.removeWhere((d) => d.id == deviceId);
    notifyListeners();
  }

  Future<void> loadTenants() async {
    tenants = await apiService.fetchTenants(); // Fetch tenants from the API
    notifyListeners();
  }

  List<Device> getDevices(String tenantId) {
    return tenants.firstWhere((t) => t.id == tenantId).devices;
  }
}
