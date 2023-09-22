import 'package:flutter/material.dart';
import 'package:unit_test_flutter/common/injection.dart';
import 'package:unit_test_flutter/presentation/post_screen/post_screen.dart';

void main() {
  configureDependencies(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: PostListScreen());
  }
}
