import 'package:go_router/go_router.dart';
import 'package:mobile_application/feature/user/presentation/screen/user_screen.dart';

class UserRouteRegistrar {
  static RouteBase get userRoute => GoRoute(
        path: '/user',
        name: 'user-screen',
        builder: (context, state) => const UserScreen(),
      );
}
