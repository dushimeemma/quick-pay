import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_pay/core/constants.dart';
import 'package:quick_pay/features/qr_code/bloc/navigation/cubit/qr_code_nav_cubit.dart';

class QRCode extends StatelessWidget {
  const QRCode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrCodeNavCubit, int>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(Constants.appBarTitle),
        ),
        body: Constants.bottomNavigators.elementAt(state),
        bottomNavigationBar: BottomNavigationBar(
          items: Constants.bottomNavItems,
          currentIndex: state,
          selectedItemColor: Constants.primary,
          onTap: (int index) => context.read<QrCodeNavCubit>().navigate(index),
        ),
      ),
    );
  }
}
