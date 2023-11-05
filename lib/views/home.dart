import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:honey_pot/views/detail.dart';
import 'package:honey_pot/views/recipe.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood), label: 'Recipes'),
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions), label: 'Subscription'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
          iconSize: 30,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
        ),
        body: Stack(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.amber[100], Colors.deepOrange[200]])),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: kIsWeb
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Honey",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange)),
                      Text("Pot",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))
                    ]),
                Row(
                  mainAxisAlignment:
                      kIsWeb ? MainAxisAlignment.start : MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.grey[700],
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications_none),
                      color: Colors.grey[700],
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Are you feeling hungry?",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Come and buzz your way over onto our app and discover the many different recipes we have available. We offer many sweets and desserts that you may be craving. Whatever it may be, we are sure to have one recipe for you.",
                    style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                Container(
                  height: 425,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    foodNames: recipes[index].foodNames,
                                    images: recipes[index].images,
                                    images1: recipes[index].images1,
                                    images2: recipes[index].images2,
                                    ingredients: recipes[index].ingredients,
                                    instructions: recipes[index].instructions,
                                    duration: recipes[index].duration,
                                    servings: recipes[index].servings,
                                    calories: recipes[index].calories,
                                  ),
                                ),
                              );
                            },
                            child: AspectRatio(
                                aspectRatio: 1.1 / 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                        child: Stack(children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.asset(
                                          recipes[index].images,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: 250,
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 50,
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 4,
                                              horizontal: 50,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[700],
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              recipes[index].foodNames,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            )),
                                      ),
                                      Positioned(
                                        right: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white,
                                          ),
                                          height: 40,
                                          width: 80,
                                          child: Center(
                                              child: Text(
                                                  '${recipes[index].duration} min',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey[700],
                                                  ))),
                                        ),
                                      ),
                                    ])),
                                  ],
                                )));
                      },
                      separatorBuilder: (context, _) => SizedBox(
                            width: 12,
                          ),
                      itemCount: 7),
                ),
              ],
            ),
          ),
        ]));
  }
}
