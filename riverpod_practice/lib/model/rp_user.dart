import 'package:flutter/material.dart';

class RPUser {
  final String id = UniqueKey().toString();
  final String name;
  final int age;

  RPUser({required this.name, required this.age});
}
