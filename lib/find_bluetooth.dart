import 'package:flutter/material.dart';

class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  BluetoothDevice? connectedDevice; // Null olabilir olarak işaretleyin

  @override
  void initState() {
    super.initState();
    _checkBluetoothState();
    _startScan();
  }

  void _checkBluetoothState() async {
    bool isBluetoothAvailable = await flutterBlue.isOn;
    if (!isBluetoothAvailable) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Bluetooth is not available'),
            content: Text('Please enable Bluetooth and try again.'),
            actions: <Widget>[
              TextButton(
                // FlatButton yerine TextButton kullanın
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _startScan() {
    flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        if (result.device.name.isNotEmpty) {
          setState(() {
            connectedDevice = result.device;
          });
        }
      }
    });
    flutterBlue.startScan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              // RaisedButton yerine ElevatedButton kullanın
              onPressed: _startScan,
              child: Text('Scan for Devices'),
            ),
            SizedBox(height: 20),
            Text(
              connectedDevice != null
                  ? 'Connected Device: ${connectedDevice!.name}'
                  : 'No device connected',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
