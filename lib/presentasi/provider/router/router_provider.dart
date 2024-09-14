import 'package:absensi/presentasi/page/home_page/home_page.dart';
import 'package:absensi/presentasi/page/login_page/login_page.dart';
import 'package:absensi/presentasi/page/spalshscreen_page/splashscreen_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
      routes: [
        GoRoute(
          path: "/splashScreen",
          name: "splashScreen",
          builder: (context, state) => const SplashScreenPage(),
        ),
        GoRoute(
          path: "/login",
          name: "login",
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: "/home",
          name: "home",
          builder: (context, state) => const HomePage(),
        ),
      ],
      initialLocation: "/splashScreen",
      debugLogDiagnostics: false,
    );
