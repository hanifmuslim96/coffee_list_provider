import 'package:flutter/material.dart';
import 'package:kopilagi/item.dart';
import 'package:kopilagi/screen_login.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:kopilagi/my_schedule.dart';

class ScreenAwal extends StatefulWidget {
  @override
  _ScreenAwalState createState() => _ScreenAwalState();
}

class _ScreenAwalState extends State<ScreenAwal> {
  void addCarts(context) {
    Provider.of<Myschedule>(context).addCarts();
  }

  @override
  Widget build(BuildContext context) {
    var carts = Provider.of<Myschedule>(context).carts;
    int totalPrice = Provider.of<Myschedule>(context).totalPrice();
    var f = NumberFormat('Rp ###,###.###', 'pt-br');
    var formattedTP = f.format(totalPrice);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              //di wrap with widget dengan ink well agar bisa di klik
              onTap: () {
                // tambahkan on tap dan function ()
                Navigator.of(context).pushNamed('produk');
                Navigator.of(context).pushNamed('login');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ScreenLogin('sda');
                    },
                  ),
                );
              },
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Color(0x99bb7f6a),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: carts.length,
                itemBuilder: (_, i) {
                  return Items(
                    index: i,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                decoration: BoxDecoration(),
                child: Text(
                  'Total Price : $formattedTP',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0x99bb7f6a),
        splashColor: Colors.black,
        child: Icon(
          Icons.add,
          size: 20,
        ),
        onPressed: () {
          addCarts(context);
        },
      ),
    );
  }
}
