import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/tenant_model.dart';
import '../providers/tenant_device_provider.dart';
import 'device_screen.dart';

class TenantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tenantProvider = Provider.of<TenantDeviceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tenants'),
      ),
      body: tenantProvider.tenants.isEmpty
          ? Center(child: Text('NO TENANTS'))
          : ListView.builder(
              itemCount: tenantProvider.tenants.length,
              itemBuilder: (context, index) {
                final tenant = tenantProvider.tenants[index];
                return ListTile(
                  title: Text(tenant.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeviceScreen(tenantId: tenant.id),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
