import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, child) => Scaffold(
        body: Center(
          child: Text(
            'ianan',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ),
      theme: ThemeData(
        textTheme: AppTextStyles.textTheme,
        scaffoldBackgroundColor: AppColors.secondaryWhite,
      ),
      darkTheme: ThemeData(
        textTheme: AppTextStylesDark.darkTextTheme,
        scaffoldBackgroundColor: AppColors.primaryBlack,
      ),
    );
  }
}
