import 'package:bloc/bloc.dart';

class QrCodeTextCubit extends Cubit<String> {
  QrCodeTextCubit() : super('');

  void updateCode(String code) => emit(code);
}
