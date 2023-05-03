import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_service.dart';
import 'package:watcher_web/controllers/database.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthService authService,
  })  : _authService = authService,
        super(AuthenticationInitial()) {
    on<LoginWithEmailAndPasswordEvent>(_mapLoginWithEmailAndPasswordEvent);
    on<CreateAccountEvent>(_mapCreateAccountEvent);
  }

  final AuthService _authService;

  Future<void> _mapLoginWithEmailAndPasswordEvent(
    LoginWithEmailAndPasswordEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      await _authService.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      final name = await DatabaseService()
          .getUser(email: event.email, password: event.password);
      emit(SuccessState(name: name!));
    } catch (e) {
      emit(
        ErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _mapCreateAccountEvent(
    CreateAccountEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      await _authService.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
        name: event.name,
        //fullName: event.name,
        phoneNumber: event.phoneNumber,
      );
      await DatabaseService().addUser(
          //name: event.name,
          name: event.name,
          phoneNumber: event.phoneNumber,
          email: event.email);
      emit(SuccessState(name: event.email));
    } catch (e) {
      emit(
        ErrorState(
          message: e.toString(),
        ),
      );
    }
  }
}
