import 'package:bloc/bloc.dart';
import 'package:chat_sphere_app/Features/Auth/bloc/auth_bloc/auth_event.dart';
import 'package:chat_sphere_app/Features/Auth/bloc/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {}
}
