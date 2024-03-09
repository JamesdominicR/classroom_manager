import 'package:classroom_manager/provider/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  final Widget child;
  const AppProviders({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<HomeProvider>(
     create: (context) => HomeProvider(),
      child: child,
    );
  }
}