import 'package:flutter/material.dart';

class Villain extends StatefulWidget {
  Villain({this.id});
  final Map id;

  @override
  _VillainState createState() => _VillainState();
}

class _VillainState extends State<Villain> {
  String teks1 = "";
  String teks2 = "";
  String teks3 = "";
  String teks4 = "";
  double wvisible = 0.0;
  void _selected(VillainDetails detail) {
    setState(() {
      wvisible = 1.0;
      teks1 = detail.type;
      teks2 = widget.id[detail.type]["name"];
      teks3 = widget.id[detail.type]["abilities"];
      teks4 = widget.id[detail.type]["description"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          widget.id["name"],
        ),
        actions: <Widget>[
          new PopupMenuButton<VillainDetails>(
            onSelected: _selected,
            itemBuilder: (BuildContext context) {
              return listdetail.map((VillainDetails x) {
                return new PopupMenuItem<VillainDetails>(
                  child: new Text(x.type),
                  value: x,
                );
              }).toList();
            },
          )
        ],
        backgroundColor: Colors.grey,
      ),
      body: new Stack(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                new Hero(
                  tag: widget.id["id"],
                  child: new ClipOval(
                    child: new SizedBox(
                      width: 200.0,
                      height: 200.0,
                      child: new Material(
                        child: new InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Image(
                            image:
                                AssetImage("assets/img/${widget.id["id"]}.png"),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.all(10.0)),
                    SizedBox(
                      width: 200.0,
                      height: 20,
                      child: new Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.black,
                        child: new Text(
                          widget.id["name"],
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    new Padding(padding: EdgeInsets.all(10.0)),
                    AnimatedContainer(
                      duration: (Duration(
                        milliseconds: 500,
                      )),
                      width: 100.0 * wvisible,
                      height: 25.0 * wvisible,
                      child: new Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                        elevation: 5.0,
                        child: Center(
                          child: new Text(
                            teks1.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    new Padding(padding: EdgeInsets.all(10.0)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: new Material(
                        elevation: 5.0,
                        child: new Text(
                          teks2,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    new Padding(padding: EdgeInsets.all(10.0)),
                    new Padding(
                      padding: EdgeInsets.symmetric(horizontal: 70.0),
                      child: new Material(
                        elevation: 5.0,
                        child: new Text(
                          teks3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    new Padding(padding: EdgeInsets.all(10.0)),
                    Material(
                      elevation: 5.0,
                      child: new Text(
                        teks4,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class VillainDetails {
  const VillainDetails({this.type});
  final String type;
}

List<VillainDetails> listdetail = const <VillainDetails>[
  const VillainDetails(type: "quirk"),
  const VillainDetails(type: "tributes"),
];
