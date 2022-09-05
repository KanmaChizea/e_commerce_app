import 'package:get_it/get_it.dart';
import '../../auth/auth_injection.dart' as auth_di;
import '../../home/home_injection.dart' as home_di;
import '../../saved_products/saved_item_injection.dart' as si_di;
import '../../settings/settings_injection.dart' as settings_di;
import '../../cart/cart_injection.dart' as cart_di;

final sl = GetIt.instance;

void init() {
  auth_di.init();
  home_di.init();
  si_di.init();
  settings_di.init();
  cart_di.init();
}
