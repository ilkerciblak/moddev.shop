import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/common/theme/input_decoration/input_decoration.dart';
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
        inputDecorationTheme: AppFormTheme().inputDecorationThemeLight,
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ButtonStyle(
        //     backgroundColor: WidgetStatePropertyAll(AppColors.primaryBlack),
        //     textStyle: WidgetStatePropertyAll(
        //       AppTextStylesDark.darkTextTheme.labelMedium,
        //     ),
        //   ),
        // ),
      ),
      darkTheme: ThemeData(
        textTheme: AppTextStylesDark.darkTextTheme,
        scaffoldBackgroundColor: AppColors.primaryBlack,
        inputDecorationTheme: AppFormTheme().inputDecorationThemeDark,
        // elevatedButtonTheme: const ElevatedButtonThemeData(
        //   style: ButtonStyle(
        //     backgroundColor: WidgetStatePropertyAll(AppColors.secondaryWhite),
        //   ),
        // ),
      ),
    );
  }
}
