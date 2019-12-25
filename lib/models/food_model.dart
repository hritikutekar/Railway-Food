import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  final String foodName;
  final String foodType;
  final String foodPrice;
  final bool veg;
  final String foodDescription;
  final String foodImage;
  final double foodRating;

  Food({
    this.foodRating,
    this.foodName,
    this.foodType,
    this.foodPrice,
    this.veg,
    this.foodDescription,
    this.foodImage,
  });

  factory Food.fromDoc(DocumentSnapshot doc) {
    return Food(
      foodName: doc['foodName'],
      foodType: doc['foodType'],
      foodPrice: doc['foodPrice'],
      veg: doc['veg'],
      foodDescription: doc['foodDescription'],
      foodImage: doc['foodImage'],
      foodRating: doc['foodRating'],
    );
  }
}
