import 'package:bloc/bloc.dart';
import 'auth_service.dart';
import 'package:watcher_web/screens/database.dart';
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
      final name = await DatabaseService().getUser(email: event.email);
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
      );
      await DatabaseService().addUser(fullName: event.name, email: event.email);
      emit(SuccessState(name: event.name));
    } catch (e) {
      emit(
        ErrorState(
          message: e.toString(),
        ),
      );
    }
  }
}