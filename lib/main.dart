import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:FlutterGalleryApp/res/res.dart';

import 'app.dart';

void main() {
  runApp(MyApp());
}

class ConnectivityOverlay {
  ConnectivityOverlay._();
  static ConnectivityOverlay _connectivityOverlay;

  ConnectivityOverlay() {
    _connectivityOverlay ??= ConnectivityOverlay._();
  }

  static OverlayEntry overlayEntry;

  void showOverlay(BuildContext context, Widget child) {
    OverlayState overlayState = Overlay.of(context);

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        top: MediaQuery.of(context).viewInsets.top + 50,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.mercury,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );

    overlayState.insert(overlayEntry);
  }

  void removeOverlay(BuildContext context) {
    overlayEntry?.remove();
  }
}
