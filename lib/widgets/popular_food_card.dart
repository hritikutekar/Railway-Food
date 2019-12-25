import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:railway_food/models/food_model.dart';

class PopularFoodCard extends StatelessWidget {
  const PopularFoodCard({
    Key key,
    @required this.food,
  }) : super(key: key);

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200.0,
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.network(
                    food.foodImage,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 5.0,
                    right: 5.0,
                    child: Image.asset(
                      food.veg
                          ? 'assets/images/veg_symbol.png'
                          : 'assets/images/non_veg_symbol.png',
                      width: 30.0,
                      height: 30.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      food.foodName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.sarabun(
                        textStyle: TextStyle(
                          color: Colors.blueGrey[800],
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    '\u20B9' + food.foodPrice,
                    style: GoogleFonts.sarabun(
                      textStyle: TextStyle(
                        color: Colors.blueGrey[800],
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(child: SizedBox.shrink()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      food.foodType,
                      style: GoogleFonts.sarabun(
                        textStyle: TextStyle(
                          color: food.veg ? Colors.green[800] : Colors.red[800],
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: food.veg ? Colors.green[800] : Colors.red[800],
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 15.0,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            food.foodRating.toString(),
                            style: GoogleFonts.sarabun(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
