import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserState {}

class UserAuthenticated extends UserState {
  final User user;
  UserAuthenticated(this.user);
}

class UserUnauthenticated extends UserState {}

class UserBloc extends Cubit<UserState> {
  UserBloc() : super(UserUnauthenticated());

  void setUser(User? user) {
    if (user != null) {
      emit(UserAuthenticated(user));
    } else {
      emit(UserUnauthenticated());
    }
  }
}
