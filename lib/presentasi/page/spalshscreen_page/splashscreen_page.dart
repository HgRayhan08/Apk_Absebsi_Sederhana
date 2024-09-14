import 'package:absensi/presentasi/provider/login_provider/user_data.dart';
import 'package:absensi/presentasi/provider/router/router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends ConsumerWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<bool?>>(
      userDataProvider,
      (previous, next) {
        next.when(
          data: (user) {
            Future.delayed(
              const Duration(milliseconds: 1000),
              () {
                if (user == true) {
                  ref.read(routerProvider).goNamed("home");
                } else {
                  ref.read(routerProvider).goNamed("login");
                }
              },
            );
          },
          loading: () {},
          error: (error, stack) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.toString()),
              ),
            );
          },
        );
      },
    );

    return const Scaffold(
      body: Center(
        child: Text(
          "Absensi",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
