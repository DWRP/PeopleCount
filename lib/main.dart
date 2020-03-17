import 'package:flutter/material.dart';

void main() => runApp( 
  MaterialApp(
    title:"People Count",
    debugShowCheckedModeBanner: false,
    home: Home(),
    ),
 );

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  int _people = 0;
  String msg = "Pode entrar";
  void _addOrRemove(int value){
      setState(() {
        _people+=value;
        if(_people<0){
          msg = "Mundo invertido";
        }else if(_people<=10){
          msg = "Pode entrar";
        }else{
          msg = "Lotado!!!";
        }
      });
  }
  
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpeg",
          fit: BoxFit.cover,
          height: 1920,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child:FlatButton(
                    onPressed: (){
                      _addOrRemove(1);
                    }, 
                    child: Text(
                      "+1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40
                        ),
                      ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child:FlatButton(
                  onPressed: (){
                    _addOrRemove(-1);
                  }, 
                  child: Text(
                    "-1",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40
                    ),
                  ),
                  ),
                )
              ],
            ),
            Text(
              msg,
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30
              ),
            ),
            ],
          ),
      ],
    );
  }
}