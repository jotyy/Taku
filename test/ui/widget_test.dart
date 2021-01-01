import 'package:app/app.dart';
import 'package:app/data/model/result.dart';
import 'package:app/ui/app_theme.dart';
import 'package:app/ui/component/loading.dart';
import 'package:app/ui/page/home/home_page.dart';
import 'package:app/ui/page/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:mockito/mockito.dart';

import '../data/dummy/dummy_news.dart';

class MockAppTheme extends Mock implements AppTheme {}

class MockHomeViewModel extends Mock implements HomeViewModel {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  Get.testMode = true;

  final mockAppTheme = MockAppTheme();
  when(mockAppTheme.setting).thenReturn(ThemeMode.light);
  when(mockAppTheme.themeMode())
      .thenAnswer((_) => Future.value(ThemeMode.light));

  final mockHomeViewModel = MockHomeViewModel();
  when(mockHomeViewModel.fetchNews()).thenAnswer((_) => Future.value());
  when(mockHomeViewModel.news).thenReturn(Result.success(data: dummyNews));

  final mockNavigatorObserver = MockNavigatorObserver();

  testWidgets('App widget test', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appThemeNotifierProvider.overrideWithValue(mockAppTheme),
          homeViewModelProvider.overrideWithValue(mockHomeViewModel),
        ],
        child: App(),
      ),
    );
  });

  testWidgets('HomePage widget test', (tester) async {
    await provideMockedNetworkImages(() async {
      final page = HomePage();
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appThemeNotifierProvider.overrideWithValue(mockAppTheme),
            homeViewModelProvider.overrideWithValue(mockHomeViewModel),
          ],
          child: GetMaterialApp(
            home: page,
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byWidget(page), findsOneWidget);
    });
  });

  testWidgets('Loading widget test', (tester) async {
    const loading = Loading();
    await tester.pumpWidget(loading);
    expect(find.byWidget(loading), findsOneWidget);
  });
}
