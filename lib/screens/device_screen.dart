import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tenant_device_provider.dart';

class DeviceScreen extends StatelessWidget {
  final String tenantId;

  DeviceScreen({required this.tenantId});

  @override
  Widget build(BuildContext context) {
    final tenantDevices =
        Provider.of<TenantDeviceProvider>(context).getDevices(tenantId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Devices'),
      ),
      body: tenantDevices.isEmpty
          ? Center(child: Text('NO DEVICES'))
          : ListView.builder(
              itemCount: tenantDevices.length,
              itemBuilder: (context, index) {
                final device = tenantDevices[index];
                return ListTile(
                  title: Text(device.name),
                  subtitle: Text('Usage: ${device.usage}'),
                );
              },
            ),
    );
  }
}
