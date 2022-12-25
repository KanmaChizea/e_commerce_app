import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutProgressCubit extends Cubit<int> {
  CheckoutProgressCubit() : super(1);

  setIndex(int index) => emit(index);
}
