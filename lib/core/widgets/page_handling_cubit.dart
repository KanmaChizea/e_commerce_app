import 'package:flutter_bloc/flutter_bloc.dart';

class PageHandlingCubit extends Cubit<int> {
  PageHandlingCubit() : super(0);
  goto(int page) {
    emit(page);
  }
}
