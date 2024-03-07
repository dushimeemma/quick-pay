import 'package:flutter/material.dart';
import 'package:quick_pay/features/qr_code/widgets/generate_qr_code.dart';
import 'package:quick_pay/features/qr_code/widgets/scan_qr_code.dart';

class Constants {
  static const List<Widget> bottomNavigators = [
    ScanQRCode(),
    GenerateQRCode(),
  ];

  static const List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.qr_code_scanner),
      label: 'Scan',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.qr_code),
      label: 'Generate',
    ),
  ];

  static String textInputHint = 'Enter your MoMo Pay Code';
  static String saveQRCodeFailedMessage = 'Something went wrong!';
  static String saveQRCodeSuccessMessage = 'QR Code saved successfully!';
  static String androidSaveFileDirectory = '/storage/emulated/0/Download';
  static String appBarTitle = 'Quick Pay';

  static Color? primary = Colors.amber[800];
  static Color? textColor = Colors.white;
  static Color? danger = Colors.red[800];

  static OutlineInputBorder outLineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(width: 1.0),
  );
}
