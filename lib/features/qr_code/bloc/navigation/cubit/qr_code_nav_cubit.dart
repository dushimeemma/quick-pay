import 'package:bloc/bloc.dart';

class QrCodeNavCubit extends Cubit<int> {
  QrCodeNavCubit() : super(0);

  void navigate(int index) => emit(index);
}
