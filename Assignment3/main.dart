import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connectivity Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode,
      home: ConnectivityDemo(toggleTheme: _toggleTheme),
    );
  }
}

class ConnectivityDemo extends StatefulWidget {
  final VoidCallback toggleTheme;

  ConnectivityDemo({required this.toggleTheme});

  @override
  _ConnectivityDemoState createState() => _ConnectivityDemoState();
}

class _ConnectivityDemoState extends State<ConnectivityDemo> {
  static const platform = MethodChannel('battery_channel');
  late ConnectivityResult _connectivityResult;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    _startBatteryMonitor();
  }

  Future<void> _checkConnectivity() async {
    ConnectivityResult result;
    try {
      result = await Connectivity().checkConnectivity();
    } catch (e) {
      result = ConnectivityResult.none;
    }

    if (!mounted) {
      return;
    }

    setState(() {
      _connectivityResult = result;
    });
  }

  Future<void> _startBatteryMonitor() async {
    try {
      final String result = await platform.invokeMethod('startBatteryMonitor');
      print(result);
    } on PlatformException catch (e) {
      print("Failed to start battery monitor: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connectivity Demo'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Connectivity Status: ${_connectivityResult.toString()}',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _checkConnectivity,
        tooltip: 'Check Connectivity',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
