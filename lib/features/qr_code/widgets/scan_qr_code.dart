import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:quick_pay/core/utils.dart';
import 'package:ussd_advanced/ussd_advanced.dart';

class ScanQRCode extends StatelessWidget {
  const ScanQRCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24.0),
      child: MobileScanner(
        onDetect: (capture) async {
          final List<Barcode> barcodes = capture.barcodes;
          String? barcode = barcodes.first.rawValue;
          if (barcode != null) {
            String code = Utils.generateCode(code: barcode);
            try {
              await UssdAdvanced.sendUssd(code: code, subscriptionId: -1);
            } catch (e) {
              debugPrint('error : $e');
            }
            await UssdAdvanced.cancelSession();
          }
        },
      ),
    );
  }
}
