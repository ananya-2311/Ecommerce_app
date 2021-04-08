import 'package:shopping_app/widgets/cart_screen.dart';
import 'package:shopping_app/widgets/red_dress.dart';
import 'package:shopping_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class Chatscreen extends StatefulWidget {
  @override
  _ChatscreenState createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.pink,
          title: Text('Shopyyy'),
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {}),
            new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> new CartScreen()));
                }),

          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter text',
                      hintText: 'Enter text',
                    ),
                  ),
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Share'),
                  onPressed: (){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RedDress()
                        ));
                  },
                )
              ],
            )
        )
    );

  }
}
