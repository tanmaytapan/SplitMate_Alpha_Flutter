import 'package:flutter/material.dart';
import 'package:splitmate/screens/add_tenant_screen.dart';
import 'package:splitmate/screens/device_screen.dart';
import 'package:splitmate/screens/tenant_screen.dart';
import 'package:splitmate/services/mqtt_service.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'package:provider/provider.dart';
import 'models/auth_model.dart';
import 'providers/tenant_device_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthModel()),
        ChangeNotifierProvider(create: (_) => TenantDeviceProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the TenantDeviceProvider
    final tenantDeviceProvider =
        Provider.of<TenantDeviceProvider>(context, listen: false);

    // Initialize the MQTT Service and connect
    final mqttService = MqttService(tenantDeviceProvider);
    mqttService.connect();

    return MaterialApp(
      title: 'SplitMate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
      routes: {
        '/dashboard': (context) => DashboardScreen(),
        '/add_tenant': (context) => AddTenantScreen(),
        '/tenant': (context) => TenantScreen(),
        '/device': (context) =>
            DeviceScreen(tenantId: ''), // Updated to include tenantId
      },
    );
  }
}
