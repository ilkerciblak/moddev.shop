import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/common/config/init.dart';
import 'package:mobile_application/feature/_feature.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initProjectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const LoginScreen(),
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
