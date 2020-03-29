import 'package:flutter/material.dart';
import 'package:kopilagi/my_schedule.dart';
import 'package:kopilagi/screen_login.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Items extends StatefulWidget {
  const Items({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  void addItem(context) {
    Provider.of<Myschedule>(context).addItem(widget.index);
  }

  void removeItem(context) {
    Provider.of<Myschedule>(context).removeItem(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var carts = Provider.of<Myschedule>(context).carts;
    var data = carts[widget.index];
    var f = NumberFormat('Rp ###,###.###', 'pt-br');
    var formattedHarga = f.format(carts[widget.index]['harga']);
    var formattedTotal =
        f.format(carts[widget.index]['qty'] * carts[widget.index]['harga']);

    int picIndex = widget.index % 5;
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Image.asset(
              'assets/${picIndex}.png', //literal String
              width: 60,
              height: 60,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ScreenLogin('sda');
                      },
                    ),
                  );
                },
                child: Text('${data['barang']}'),
              ), // data['barang']
              Text('$formattedHarga'), // data['harga']
            ],
          ),
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Qty : ${data['qty']}'), // carts[widget.index]['qty']
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 3.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0x99bb7f6a),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {
                  addItem(context);
                },
                child: Icon(
                  Icons.add,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0x99bb7f6a),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: InkWell(
              onTap: () {
                removeItem(context);
              },
              child: Icon(
                Icons.remove,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          // decoration: BoxDecoration(
          //   color: Colors.blue,
          // ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('$formattedTotal'),
          ),
        )
      ],
    );
  }
}
