import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/auth_bloc.dart';
import '../blocs/auth/auth_event.dart';
import '../blocs/auth/auth_state.dart';
import '../widgets/tiles/tiles_board.dart';
import 'profile_screen.dart';
import 'videos_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final tilesData = [
      {
        'title': 'Profile',
        'icon': Icons.person,
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        ),
      },
      {
        'title': 'Videos',
        'icon': Icons.video_library,
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VideosScreen()),
        ),
      },
      {
        'title': 'Settings',
        'icon': Icons.settings,
        'onTap': () {
          // Navigate to settings or handle other actions
        },
      },
      {
        'title': 'Logout',
        'icon': Icons.logout,
        'onTap': () {
          context.read<AuthBloc>().add(LogoutEvent());
        },
      },
      {
        'title': 'Settings',
        'icon': Icons.settings,
        'onTap': () {
          // Navigate to settings or handle other actions
        },
      },
      {
        'title': 'Settings',
        'icon': Icons.settings,
        'onTap': () {
          // Navigate to settings or handle other actions
        },
      },
    ];

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Unauthenticated) {
          Future.microtask(() => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false));
          return const SizedBox.shrink();
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  context.read<AuthBloc>().add(LogoutEvent());
                },
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TilesBoard(tilesData: tilesData),
          ),
        );
      },
    );
  }
}
