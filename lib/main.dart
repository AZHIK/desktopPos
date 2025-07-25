import 'package:flutter/material.dart';
import 'bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap(); // init DB, services, etc.
}
