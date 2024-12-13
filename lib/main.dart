import 'package:apkakuby/screens/home_screen.dart';
import 'package:apkakuby/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'blocs/auth/auth_bloc.dart';

void main() {
  runApp(const MyApp());
}


final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
      ],
    ),
  ],
);



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp.router(
        title: 'Strona Sosulskich',
        debugShowCheckedModeBanner: false,
          theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.lightBlue,
        ),
        routerConfig: _router,
      ),
    );
  }
}
