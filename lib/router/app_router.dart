import 'package:go_router/go_router.dart';
import 'package:pharmavault/router/routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: initialRoute,
    routes: appRoutes,
    debugLogDiagnostics: true,
  );
}
