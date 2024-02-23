import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading_screen.dart';




bool _barrierDismissible = true;

double _borderRadius = 8.0;
Color _backgroundColor = Colors.transparent;
Curve _insetAnimCurve = Curves.easeInOut;

//Widget _progressWidget = Lottie.asset(Res.loader,width: 270,height: 270);

class ProgressDialog {
  late _Body _dialog;

  ProgressDialog() {
    _barrierDismissible = true;
  }

  void dismiss() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

   show() {
    _dialog = _Body();
    Get.dialog(
      Material(
        type: MaterialType.transparency,
        child: WillPopScope(
          onWillPop: () {
            return Future.value(_barrierDismissible);
          },
          child: Dialog(
              backgroundColor: _backgroundColor,
              insetAnimationCurve: _insetAnimCurve,
              insetAnimationDuration: const Duration(milliseconds: 100),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(_borderRadius))),
              child: _dialog),
        ),
      ),
      barrierDismissible: false,
    );
  }
}

// ignore: must_be_immutable
class _Body extends StatefulWidget {
  final _BodyState _dialog = _BodyState();

  @override
  State<StatefulWidget> createState() {
    return _dialog;
  }
}

class _BodyState extends State<_Body> {
  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;

    var padding = width / 9;

    return Container(
      padding: EdgeInsets.all(padding),
      child: const LoadingScreen(),
    );
  }
}