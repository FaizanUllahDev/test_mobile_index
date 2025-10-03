import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  Future<void> login() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      // Add login logic here
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      emit(state.copyWith(isLoading: false, isAuthenticated: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void logout() {
    emit(const AuthState());
  }
}
