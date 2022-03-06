import 'package:bloc/bloc.dart';
import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/services/services.dart';
import 'package:meta/meta.dart';

part 'app_manager_event.dart';
part 'app_manager_state.dart';

class AppManagerBloc extends Bloc<AppManagerEvent, AppManagerState> {
  late Authentication _appAuth;

  Authentication get appAuth => _appAuth;

  User? _currentUser;
  User? get currentUser => _currentUser;

  AppManagerBloc() : super(AppManagerInitial()) {
    _appAuth = Authentication(this);

    on<AppManagerEvent>((event, emit) {});
  }
}
