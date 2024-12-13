import 'package:apkakuby/widgets/login_screen_widgets/login_screen_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/auth/auth_bloc.dart';
import '../blocs/auth/auth_state.dart';
import '../widgets/forms/login_form.dart'; 

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tilesData = [
      {'title': 'Profile', 'image': 'assets/images/profile.jpg', 'route': '/profile'},
      {'title': 'Videos', 'image': 'assets/images/videos.jpg', 'route': '/videos'},
      {'title': 'Settings', 'image': 'assets/images/settings.jpg', 'route': '/settings'},
      {'title': 'Logout', 'image': 'assets/images/logout.jpg', 'route': '/logout'},
      {'title': 'Analytics', 'image': 'assets/images/analytics.jpg', 'route': '/analytics'},
      {'title': 'Help', 'image': 'assets/images/help.jpg', 'route': '/help'},
    ];

    var size = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double itemHeight =
        (size.height - statusBarHeight) / 3;
    final double itemWidth = size.width / 2;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          context.go('/home');
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: itemWidth / itemHeight,
              shrinkWrap: false,
              children: List.generate(6, (index) {
                return LoginScreenTile(title: 'title', imagePath: 'imagePath', onTap: () => ());
              })
            ),
            // Center Login Form
            const Center(
              child: LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}
