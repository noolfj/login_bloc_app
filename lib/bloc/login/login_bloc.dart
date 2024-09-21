import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../../api/auth_service.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService authService;

  LoginBloc({required this.authService}) : super(LoginInitial()) {
    // Обрабатываем событие LoginButtonPressed
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final response = await authService.login(event.email, event.password);
        emit(LoginSuccess(token: response['token']));
      } catch (error) {
        emit(LoginFailure(error: error.toString()));
      }
    });
  }
}
