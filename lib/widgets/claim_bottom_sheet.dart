import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:FlutterGalleryApp/res/res.dart';

class ClaimBottomSheet extends StatelessWidget {
  ClaimBottomSheet({
    this.onClaims,
  });

  final ValueChanged<int> onClaims;

  static const List climeTypes = [
    'adult',
    'harm',
    'bully',
    'violence',
    'spam',
    'copyright',
    'hate',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mercury,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: climeTypes.map((e) {
          int index = climeTypes.indexOf(e);

          return _buildClaimElement(e, index, context);
        }).toList(),
      ),
    );
  }

  Widget _buildClaimElement(String type, int index, BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onClaims(index);
      },
      child: Column(
        children: <Widget>[
          Container(
            height: 48,
            child: Center(
              child: Text(
                type.toUpperCase(),
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          if (index == climeTypes.length - 1) SizedBox(height: 33)
        ],
      ),
    );
  }
}
