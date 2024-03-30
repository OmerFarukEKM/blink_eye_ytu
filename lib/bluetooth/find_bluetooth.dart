import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  StreamSubscription? scanSubscription;
  List<ScanResult> scanResults = [];

  @override
  void initState() {
    super.initState();
    startScan();
  }

  @override
  void dispose() {
    stopScan();
    super.dispose();
  }

  void startScan() {
    scanSubscription = FlutterBlue.instance.scanResults.listen((results) {
      setState(() {
        scanResults = results;
      });
    });
    FlutterBlue.instance.startScan(timeout: Duration(seconds: 4));
  }

  void stopScan() {
    FlutterBlue.instance.stopScan();
    scanSubscription?.cancel();
  }

  void refreshScan() {
    stopScan();
    setState(() {
      scanResults.clear();
    });
    startScan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Cihazları Bul'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: scanResults.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(scanResults[index].device.name ?? 'Unknown'),
                  subtitle: Text(scanResults[index].device.id.toString()),
                  onTap: () {
                    scanResults[index].device.connect();
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: refreshScan,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
