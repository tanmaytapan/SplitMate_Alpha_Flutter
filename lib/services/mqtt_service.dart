import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:provider/provider.dart';
import '../providers/tenant_device_provider.dart';

class MqttService {
  final mqtt.MqttClient client = mqtt.MqttClient('broker.hivemq.com', '');
  TenantDeviceProvider? tenantDeviceProvider;

  // Constructor to accept the provider
  MqttService(this.tenantDeviceProvider);

  Future<void> connect() async {
    client.logging(on: true);
    await client.connect();
    client.subscribe('tenant/data', mqtt.MqttQos.atMostOnce);

    client.updates!
        .listen((List<mqtt.MqttReceivedMessage<mqtt.MqttMessage>> messages) {
      final mqtt.MqttPublishMessage message =
          messages[0].payload as mqtt.MqttPublishMessage;
      final payload = mqtt.MqttPublishPayload.bytesToStringAsString(
          message.payload.message);

      // Parse the payload and update the provider
      final parsedData = parsePayload(payload); // Your logic to parse the data
      tenantDeviceProvider?.updateTenantData(parsedData);
    });
  }

  // Example parsing method
  Map<String, dynamic> parsePayload(String payload) {
    // Add your logic here to parse the payload and convert it to a format suitable for the provider
    return {}; // Example: return a map or relevant data structure
  }
}
