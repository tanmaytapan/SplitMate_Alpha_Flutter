import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tenant_device_provider.dart';
import '../models/device_model.dart';

class DeviceManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tenantDeviceProvider = Provider.of<TenantDeviceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Devices'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Device Name'),
              onFieldSubmitted: (deviceName) {
                tenantDeviceProvider.addDeviceToTenant(
                    'tenantId',
                    Device(
                        id: 'newId',
                        name: deviceName)); // Replace with actual logic
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tenantDeviceProvider.getDevices('tenantId').length,
                itemBuilder: (context, index) {
                  final device =
                      tenantDeviceProvider.getDevices('tenantId')[index];
                  return ListTile(
                    title: Text(device.name),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        tenantDeviceProvider.removeDeviceFromTenant(
                            'tenantId', device.id);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
