import 'package:get_it/get_it.dart';
import 'auth/auth_injection.dart' as auth_di;
import 'home/home_injection.dart' as home_di;

final sl = GetIt.instance;

void init() {
  auth_di.init();
  home_di.init();
}
