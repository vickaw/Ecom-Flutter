import 'package:flutter/material.dart';
import 'package:hello_shop/views/splash/splash.dart';
import 'views/shop_profile/shop_profile.dart';
import 'views/checkout/checkout.dart';
import 'views/messages/message_details.dart';
import 'views/messages/messages.dart';
import 'views/checkout/checkout_success.dart';
import 'views/notifications/notifications.dart';
import 'views/product_details/product_details.dart';
import 'views/search_results/search_results.dart';
import 'views/tabs/tabs.dart';
import 'views/auth/auth.dart';
import 'views/categories/categories.dart';
import 'views/onboarding/onboarding.dart';

const String homeViewRoute = '/';
const String splashViewRoute = 'splash_screen';
const String onboardingViewRoute = 'onboarding';
const String authViewRoute = 'auth';
const String categoriesViewRoute = 'categories';
const String searchResultsViewRoute = 'search_results';
const String productDetailsViewRoute = 'product_details';
const String notificationsViewRoute = 'notifications';
const String messagesViewRoute = 'messages';
const String messageDetailsViewRoute = 'message_details';
const String checkoutViewRoute = 'checkout';
const String checkoutSuccessViewRoute = 'checkout_success';
const String shopProfileViewRoute = 'shop_profile';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashViewRoute:
      return MaterialPageRoute(builder: (_) => SplashPage());
    case homeViewRoute:
      return MaterialPageRoute(builder: (_) => TabsPage());
    case onboardingViewRoute:
      return MaterialPageRoute(builder: (_) => OnboardingPage());
    case authViewRoute:
      return MaterialPageRoute(builder: (_) => AuthPage());
    case categoriesViewRoute:
      return MaterialPageRoute(builder: (_) => CategoriesPage());
    case searchResultsViewRoute:
      return MaterialPageRoute(
        builder: (_) => SearchResultsPage(
          keyWord: settings.arguments,
        ),
      );
    case productDetailsViewRoute:
      return MaterialPageRoute(
        builder: (_) => ProductDetailsPage(
          product: settings.arguments,
        ),
      );
    case notificationsViewRoute:
      return MaterialPageRoute(builder: (_) => NotificationsPage());
    case messagesViewRoute:
      return MaterialPageRoute(builder: (_) => MessagesPage());
    case messageDetailsViewRoute:
      return MaterialPageRoute(
        builder: (_) => MessageDetailsPage(
          name: settings.arguments,
        ),
      );
    case checkoutViewRoute:
      return MaterialPageRoute(builder: (_) => CheckoutPage());
    case checkoutSuccessViewRoute:
      return MaterialPageRoute(builder: (_) => CheckoutSuccessPage());
    case shopProfileViewRoute:
      return MaterialPageRoute(builder: (_) => ShopProfilePage(
        shopName: settings.arguments,
      ));
      break;
    default:
      return MaterialPageRoute(builder: (_) => TabsPage());
  }
}
