import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:railway_food/models/food_model.dart';
import 'package:railway_food/utils/colors.dart';
import 'package:railway_food/utils/firestore_refs.dart';
import 'package:railway_food/widgets/popular_food_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            _drawerKey.currentState.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Color(accentColor),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Color(accentColor),
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Material(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'RAILWAY FOOD \nSERVICE',
                  style: GoogleFonts.sarabun(
                    textStyle: TextStyle(
                      fontSize: 30.0,
                      color: Color(accentColor),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Popular',
                  style: GoogleFonts.sarabun(
                    textStyle: TextStyle(
                      fontSize: 19.0,
                      color: Colors.blueGrey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.0),
              Container(
                height: 230.0,
                child: StreamBuilder<QuerySnapshot>(
                  stream: foodRef.snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return SizedBox.shrink();
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        Food food =
                            Food.fromDoc(snapshot.data.documents[index]);

                        return PopularFoodCard(food: food);
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Category',
                  style: GoogleFonts.sarabun(
                    textStyle: TextStyle(
                      fontSize: 19.0,
                      color: Colors.blueGrey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: GridView(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  children: <Widget>[
                    Card(
                      elevation: 2.0,
                      child: Container(
                        width: 200.0,
                        color: Color(accentColor),
                      ),
                    ),
                    Card(
                      elevation: 2.0,
                      child: Container(
                        width: 200.0,
                        color: Color(accentColor),
                      ),
                    ),
                    Card(
                      elevation: 2.0,
                      child: Container(
                        width: 200.0,
                        color: Color(accentColor),
                      ),
                    ),
                    Card(
                      elevation: 2.0,
                      child: Container(
                        width: 200.0,
                        color: Color(accentColor),
                      ),
                    ),
                    Card(
                      elevation: 2.0,
                      child: Container(
                        width: 200.0,
                        color: Color(accentColor),
                      ),
                    ),
                    Card(
                      elevation: 2.0,
                      child: Container(
                        width: 200.0,
                        color: Color(accentColor),
                      ),
                    ),
                    Card(
                      elevation: 2.0,
                      child: Container(
                        width: 200.0,
                        color: Color(accentColor),
                      ),
                    ),
                    Card(
                      elevation: 2.0,
                      child: Container(
                        width: 200.0,
                        color: Color(accentColor),
                      ),
                    ),
                    Card(
                      elevation: 2.0,
                      child: Container(
                        width: 200.0,
                        color: Color(accentColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
