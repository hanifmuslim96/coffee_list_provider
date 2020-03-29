import 'package:flutter/material.dart';

class ScreenLogin extends StatelessWidget {
  
  ScreenLogin(this.isi);
  final String isi;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.phone,
              size: 20,
            ),
            onPressed: (){
              Navigator.pop(context, "HAHAH");
            },

          )
        ],
      ),
      body: Text(
        '${ModalRoute.of(context).settings.arguments} ---- $isi',
      ),
    );
  }
}
