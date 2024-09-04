class Device {
  final String id;
  final String name;
  final double usage;

  Device({required this.id, required this.name, required this.usage});

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'],
      name: json['name'],
      usage: json['usage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'usage': usage,
    };
  }
}
