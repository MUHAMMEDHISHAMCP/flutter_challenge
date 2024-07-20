import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
          page: WelcomeRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
        CustomRoute(
            page: AddOrUpdateRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds: 400),
        CustomRoute(
            page: SummaryRoute.page,
            transitionsBuilder: TransitionsBuilders.slideBottom,
            durationInMilliseconds: 500),
        CustomRoute(
            page: SettingsRoute.page,
            transitionsBuilder: TransitionsBuilders.slideBottom,
            durationInMilliseconds: 400),
                CustomRoute(
            page: ViewAllExpenseRoute.page,
            transitionsBuilder: TransitionsBuilders.zoomIn,
            durationInMilliseconds: 400),
      ];
}
