import 'package:cloud_firestore/cloud_firestore.dart';

// Firestore instance.
Firestore _firestore = Firestore.instance;

// Collection references.
final foodRef = _firestore.collection('Food');
