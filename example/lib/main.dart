import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_varioqub/flutter_varioqub.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Varioqub.init(clientId: 'appmetrica.XXXXXXX'); // XXXXXXX - App ID Yandex Metrica
    await Varioqub.setDefault(
      defaultMap: {
        'test_string': 'default_string',
      },
    );
    await Varioqub.fetchConfig();
    await Varioqub.activateConfig();
    debugPrint(await Varioqub.getString(key: 'test_string'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(),
      ),
    );
  }
}
