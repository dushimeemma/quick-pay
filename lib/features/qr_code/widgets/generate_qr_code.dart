// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:quick_pay/core/constants.dart';
import 'package:quick_pay/core/utils.dart';
import 'package:quick_pay/features/qr_code/bloc/navigation/cubit/qr_code_text_cubbit.dart';

class GenerateQRCode extends StatelessWidget {
  const GenerateQRCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24.0),
      child: BlocBuilder<QrCodeTextCubit, String>(
        builder: (context, state) => Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: Constants.textInputHint,
                focusedBorder: Constants.outLineInputBorder,
                enabledBorder: Constants.outLineInputBorder,
              ),
              onChanged: (value) =>
                  context.read<QrCodeTextCubit>().updateCode(value),
            ),
            const SizedBox(
              height: 24.0,
            ),
            if (state.isNotEmpty)
              Stack(
                children: <Widget>[
                  PrettyQrView.data(
                    data: state,
                    errorCorrectLevel: QrErrorCorrectLevel.H,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ElevatedButton(
                      onPressed: () =>
                          saveQRCode(context: context, state: state),
                      child: Icon(
                        Icons.download,
                        color: Constants.primary,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void saveQRCode({
    required String state,
    required BuildContext context,
  }) async {
    try {
      final qrCode = QrCode.fromData(
        data: state,
        errorCorrectLevel: QrErrorCorrectLevel.H,
      );
      final qrImage = QrImage(qrCode);
      final imageBytes = await qrImage.toImageAsBytes(
        size: 1024,
      );
      List<int> bytes = imageBytes!.buffer.asUint8List();

      final Directory appDocDir = Platform.isAndroid
          ? Directory(Constants.androidSaveFileDirectory)
          : await getApplicationDocumentsDirectory();

      String imagePath =
          '${appDocDir.path}/${DateTime.now().millisecondsSinceEpoch}.png';

      await File(imagePath).writeAsBytes(bytes);
      bool? isSaved = await GallerySaver.saveImage(
        imagePath,
        albumName: 'QRCodes',
      );

      if (isSaved!) {
        Utils.quickPaySnackBar(
          context: context,
          message: Constants.saveQRCodeSuccessMessage,
        );
      } else {
        Utils.quickPaySnackBar(
          context: context,
          backgroundColor: Constants.danger,
          message: Constants.saveQRCodeFailedMessage,
        );
      }
    } catch (e) {
      Utils.quickPaySnackBar(
        context: context,
        backgroundColor: Constants.danger,
        message: Constants.saveQRCodeFailedMessage,
      );
    }
  }
}
