import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String foodNames;
  final String images;
  final String images1;
  final String images2;
  final String ingredients;
  final String instructions;
  final String servings;
  final String calories;
  final int duration;

  DetailScreen(
      {this.foodNames,
      this.images,
      this.images1,
      this.images2,
      this.ingredients,
      this.instructions,
      this.duration,
      this.servings,
      this.calories});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: <Widget>[
                Hero(
                  child: Container(
                    height: size.height * 0.5,
                    child: Image.asset(
                      images,
                      fit: BoxFit.cover,
                    ),
                  ),
                  tag: images,
                ),
                DraggableScrollableSheet(
                  maxChildSize: 1,
                  initialChildSize: 0.6,
                  minChildSize: 0.6,
                  builder: (context, controller) {
                    return SingleChildScrollView(
                      child: Container(
                          padding: const EdgeInsets.all(24),
                          height: 1300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(foodNames,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    IconButton(
                                      icon: Icon(Icons.favorite),
                                      color: Colors.redAccent,
                                      iconSize: 28,
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.star),
                                      color: Colors.yellowAccent,
                                      iconSize: 28,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Container(
                                    child: Row(children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.grey[700])),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 16),
                                    child: Column(children: <Widget>[
                                      Text(
                                        "Servings:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '$servings',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.grey[700])),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 16),
                                    child: Column(children: <Widget>[
                                      Text(
                                        "Calories:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '$calories',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ]),
                                  ),
                                ])),
                                SizedBox(
                                  height: 44,
                                ),
                                Text(
                                  "Ingredients:",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  ingredients,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[700]),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  "Instructions:",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  instructions,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[700]),
                                ),
                                Hero(
                                  child: Container(
                                    child: Image.asset(
                                      images1,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  tag: images1,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Hero(
                                  child: Container(
                                    child: Image.asset(
                                      images2,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  tag: images2,
                                ),
                              ])),
                    );
                  },
                )
              ],
            )));
  }
}
