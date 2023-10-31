import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Auth extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
}
