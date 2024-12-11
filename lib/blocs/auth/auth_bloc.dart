import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Unauthenticated()) { // Ensure the initial state is `Unauthenticated`.
    // Register event handlers in the constructor
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }

  void _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 1)); // Simulate an API call
    emit(Authenticated());
  }

  void _onLogout(LogoutEvent event, Emitter<AuthState> emit) {
    emit(Unauthenticated());
  }
}
