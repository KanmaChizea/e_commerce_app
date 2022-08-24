import 'package:get_it/get_it.dart';
import 'auth/auth_injection.dart' as auth_di;
import 'home/home_injection.dart' as home_di;
import 'saved_products/saved_item_injection.dart' as si_di;

final sl = GetIt.instance;

void init() {
  auth_di.init();
  home_di.init();
  si_di.init();
}
