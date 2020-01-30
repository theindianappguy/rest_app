import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> meals = ["The original Neapolitan","California Style","Chicago Thin Crust",
  "Detroit Style","New England Greek", "New York Thin Crust", "St. Louis Style"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text(
          "RESTAPP",
          style: GoogleFonts.roboto(
              textStyle: TextStyle(fontSize: 18, letterSpacing: 1)),
        ),
        backgroundColor: Colors.black87,
        centerTitle: true,
        actions: <Widget>[

        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child:  Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset("assets/pizza.png", fit: BoxFit.fitWidth,),
                Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset("assets/ic_local_pizza_24px.png", height: 24, width: 24,),
                                    SizedBox(height: 4,),
                                    Text("PIZZA", style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white70
                                        )
                                    ),)
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset("assets/ic_local_dining_24px.png", height: 24, width: 24,),
                                    SizedBox(height: 4,),
                                    Text("SNACK", style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white70
                                        )
                                    ),)
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset("assets/ic_local_cafe_24px.png", height: 24, width: 24,),
                                    SizedBox(height: 4,),
                                    Text("COFFEE", style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white70
                                        )
                                    ),)
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset("assets/local_bar_24px.png", height: 24, width: 24,),
                                    SizedBox(height: 4,),
                                    Text("ALCOHOL", style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white70
                                        )
                                    ),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ListView.builder(
                            itemCount: meals.length,
                              itemBuilder: (context,index){
                              return ListTile(
                                title: Text(meals[index].toString()),
                              );
                              })
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
