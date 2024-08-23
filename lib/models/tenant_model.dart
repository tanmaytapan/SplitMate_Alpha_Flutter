import 'device_model.dart';

class Tenant {
  final String id;
  final String name;
  final List<Device> devices;

  Tenant({required this.id, required this.name, required this.devices});

  // Factory constructor for converting JSON data to Tenant object
  factory Tenant.fromJson(Map<String, dynamic> json) {
    return Tenant(
      id: json['id'],
      name: json['name'],
      devices: (json['devices'] as List)
          .map((deviceJson) => Device.fromJson(deviceJson))
          .toList(),
    );
  }

  // Method for converting Tenant object to JSON data
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'devices': devices.map((device) => device.toJson()).toList(),
    };
  }
}
