import 'package:go_router/go_router.dart';
import 'package:mobile_application/presentation/authentication/_screen.dart';

class AuthenticationRouteRegistrar {
  static RouteBase get loginRoute => GoRoute(
        path: '/login',
        name: 'login-screen',
        builder: (context, state) => const LoginScreen(),
      );
}
