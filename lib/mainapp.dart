import 'package:flutter/material.dart';
import 'package:eight_bullets/villain.dart';
import 'package:eight_bullets/villainpage.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final member = villainMember;

  @override
  Widget build(BuildContext context) {
    // timeDilation = 3.0;
    return new Scaffold(
      appBar: new AppBar(
        title: Center(
          child: new Text(
            "Eight Bullets",
            style: new TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: new Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          image: new DecorationImage(
            image: new AssetImage(
              "assets/img/hassaikai.png",
            ),
          ),
        ),
        child: new PageView.builder(
          controller: new PageController(viewportFraction: 0.5),
          itemCount: member.length,
          itemBuilder: (BuildContext context, int i) {
            return new Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 30,
              ),
              child: new Material(
                color: Color.fromRGBO(255, 255, 0, 0),
                child: new Hero(
                  tag: member[i]["id"],
                  child: new Material(
                    color: Colors.teal[100 + (i * 100)],
                    shape: CircleBorder(),
                    elevation: 10.0,
                    child: new InkWell(
                      onTap: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Villain(
                          id: member[i],
                        ),
                      )),
                      child: new Column(
                        children: <Widget>[
                          new Flexible(
                            flex: 1,
                            child: new Image(
                              image: AssetImage(
                                  "assets/img/${member[i]["id"]}.png"),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          new Padding(padding: EdgeInsets.all(10.0)),
                          Expanded(
                            child: new Text(
                              member[i]["name"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
