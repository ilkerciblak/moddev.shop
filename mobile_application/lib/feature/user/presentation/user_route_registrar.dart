import 'package:go_router/go_router.dart';
import 'package:mobile_application/feature/user/presentation/screen/_screen.dart';

class UserRouteRegistrar {
  static RouteBase get userRoute => GoRoute(
        path: '/user',
        name: 'user-screen',
        builder: (context, state) => const UserScreen(),
      );

  static RouteBase get signUpScreen => GoRoute(
        path: '/sign-up',
        name: 'register',
        builder: (context, state) => const SignUpScreen(),
      );
}
