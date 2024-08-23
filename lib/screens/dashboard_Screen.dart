import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tenant_device_provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TenantDeviceProvider>(context, listen: false).loadTenants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Consumer<TenantDeviceProvider>(
        builder: (context, tenantProvider, child) {
          final tenantDevices = tenantProvider
              .getDevices('tenantId'); // Replace 'tenantId' with actual ID
          return GridView.builder(
            padding: EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: tenantDevices.length,
            itemBuilder: (context, index) {
              return Card(
                child: Center(
                  child: Text(tenantDevices[index].name),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_tenant');
        },
        child: Icon(Icons.add),
        tooltip: 'Add Tenant',
      ),
    );
  }
}
