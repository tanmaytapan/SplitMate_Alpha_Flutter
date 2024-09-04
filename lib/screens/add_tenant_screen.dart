import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/device_model.dart';
import '../models/tenant_model.dart';
import '../providers/tenant_device_provider.dart';

class AddTenantScreen extends StatelessWidget {
  final TextEditingController _tenantNameController = TextEditingController();
  final TextEditingController _deviceNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Tenant and Devices'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _tenantNameController,
              decoration: InputDecoration(labelText: 'Tenant Name'),
            ),
            TextFormField(
              controller: _deviceNameController,
              decoration: InputDecoration(labelText: 'Device Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_tenantNameController.text.isNotEmpty &&
                    _deviceNameController.text.isNotEmpty) {
                  final newTenant = Tenant(
                    id: DateTime.now().toString(),
                    name: _tenantNameController.text,
                    devices: [
                      Device(
                        id: DateTime.now().toString(),
                        name: _deviceNameController.text,
                        usage: 0.0, // Initial usage value
                      )
                    ],
                  );
                  Provider.of<TenantDeviceProvider>(context, listen: false)
                      .addTenant(newTenant);
                  Navigator.pop(context);
                }
              },
              child: Text('Add Tenant and Device'),
            ),
          ],
        ),
      ),
    );
  }
}
