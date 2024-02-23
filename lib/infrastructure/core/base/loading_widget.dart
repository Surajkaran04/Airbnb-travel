import 'package:flutter/material.dart';
import '../../theme/colors.theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(ColorsTheme.colPrimary),
        ),
      ),
    );
  }
}
