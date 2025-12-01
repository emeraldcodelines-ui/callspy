import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<Permission, PermissionStatus> _permissionsStatus = {};

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    final statuses = await [
      Permission.microphone,
      Permission.storage,
      Permission.phone,
    ].request();

    setState(() {
      _permissionsStatus = statuses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Permission Status:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ..._permissionsStatus.entries.map((entry) {
              final permissionName = _permissionName(entry.key);
              final status = entry.value;
              return Text(
                '$permissionName: ${status.isGranted ? 'Granted' : 'Denied'}',
                style: TextStyle(
                  color: status.isGranted ? Colors.green : Colors.red,
                  fontSize: 16,
                ),
              );
            }).toList(),
            if (_permissionsStatus.values.any((status) => !status.isGranted))
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Some permissions are denied. Please enable them in settings.',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _permissionName(Permission permission) {
    switch (permission) {
      case Permission.microphone:
        return 'Microphone';
      case Permission.storage:
        return 'Storage';
      case Permission.phone:
        return 'Phone';
      default:
        return permission.toString();
    }
  }
}
