import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:FlutterGalleryApp/screens/photo_screen.dart';
import 'package:FlutterGalleryApp/screens/feed_screen.dart';


void main() {
  testWidgets('Hero test', (WidgetTester tester) async {
    final GlobalKey key = GlobalKey();

    await tester.pumpWidget(
      MaterialApp(
        key: key,
        home: FullScreenImage(
          photo: kFlutterDash,
          altDescription: 'This is Flutter dash. I love him :)',
          userName: 'kaparray',
          name: 'Kirill Adeshchenko',
          userPhoto: 'https://skill-branch.ru/img/speakers/Adechenko.jpg',
          heroTag: 'tag',
        ),
      ),
    );

    final Hero topModalBarrier = tester.widget<Hero>(
      find.byType(Hero),
    );
    expect(topModalBarrier.tag, 'tag');
    expect(true, topModalBarrier.child.runtimeType == Photo);
  });

  testWidgets('AnimatedBuilder UserAvatar', (WidgetTester tester) async {
    final GlobalKey key = GlobalKey();

    await tester.pumpWidget(
      MaterialApp(
        key: key,
        home: FullScreenImage(
          photo: kFlutterDash,
          altDescription: 'This is Flutter dash. I love him :)',
          userName: 'kaparray',
          name: 'Kirill Adeshchenko',
          userPhoto: 'https://skill-branch.ru/img/speakers/Adechenko.jpg',
          heroTag: 'tag',
        ),
      ),
    );

    await tester.pump(const Duration(milliseconds: 300));
    double oneFifth = _getOpacity(key, tester, false);
    expect(0.3, (oneFifth * 10).roundToDouble() / 10);

    await tester.pump(const Duration(milliseconds: 800));
    double full = _getOpacity(key, tester, false);
    expect(1.0, (full * 10).roundToDouble() / 10);
  });

  testWidgets('AnimatedBuilder Column with name and userName', (WidgetTester tester) async {
    final GlobalKey key = GlobalKey();

    await tester.pumpWidget(
      MaterialApp(
        key: key,
        home: FullScreenImage(
          photo: kFlutterDash,
          altDescription: 'This is Flutter dash. I love him :)',
          userName: 'kaparray',
          name: 'Kirill Adeshchenko',
          userPhoto: 'https://skill-branch.ru/img/speakers/Adechenko.jpg',
          heroTag: 'tag',
        ),
      ),
    );

    await tester.pump(const Duration(milliseconds: 800));
    double test1 = _getOpacity(key, tester, true);
    expect(0.1, (test1 * 10).roundToDouble() / 10);

    await tester.pump(const Duration(milliseconds: 1200));
    double test2 = _getOpacity(key, tester, true);
    expect(1.0, (test2 * 10).roundToDouble() / 10);
  });
}

double _getOpacity(GlobalKey key, WidgetTester tester, bool isLast) {
  final Finder finder = find.byType(Opacity);

  print(tester.widgetList(finder).toList());

  return tester.widgetList(isLast ? finder.last : finder.first).fold<double>(1.0, (double a, Widget widget) {
    final Opacity transition = widget;
    return transition.opacity;
  });
}
