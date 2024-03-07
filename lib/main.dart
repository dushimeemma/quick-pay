import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_pay/features/qr_code/bloc/navigation/cubit/qr_code_nav_cubit.dart';
import 'package:quick_pay/features/qr_code/bloc/navigation/cubit/qr_code_text_cubbit.dart';
import 'package:quick_pay/features/qr_code/pages/qr_code.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<QrCodeNavCubit>(
          create: (BuildContext context) => QrCodeNavCubit(),
        ),
        BlocProvider<QrCodeTextCubit>(
          create: (BuildContext context) => QrCodeTextCubit(),
        ),
      ],
      child: const QuickPayApp(),
    ),
  );
}

class QuickPayApp extends StatelessWidget {
  const QuickPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const QRCode(),
    );
  }
}
