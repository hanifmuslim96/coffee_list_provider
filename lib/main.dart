import 'package:flutter/material.dart';
import 'package:kopilagi/screen_login.dart';
import 'package:provider/provider.dart';
import 'package:kopilagi/my_schedule.dart';
import 'screen_awal.dart';

class ScreenAwalProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Myschedule>(
      child: ScreenAwal(),
      builder: (_) {
        return Myschedule();
      },
    );
  }
}

void main() {
  runApp(AplikasiBermanfaat());
}

class AplikasiBermanfaat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manfaat',
      home: ScreenAwalProvider(),
      routes: {
        'produk': (BuildContext context) {
          return Text('data');
        },
        'login': (BuildContext context) {
          return ScreenLogin('sda');
        },
      },
    );
  }
}
