import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'features/apps/presentation/apps_screen.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/auth/presentation/onboarding_screen.dart';
import 'features/auth/presentation/signup_screen.dart';
import 'features/auth/providers.dart';
import 'features/dashboard/presentation/dashboard_screen.dart';
import 'features/profile/presentation/profile_screen.dart';
import 'features/time_tracking/presentation/insights_screen.dart';
import 'features/wallet/presentation/wallet_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(path: '/apps', builder: (context, state) => const AppsScreen()),
    GoRoute(
      path: '/insights',
      builder: (context, state) => const InsightsScreen(),
    ),
    GoRoute(path: '/wallet', builder: (context, state) => const WalletScreen()),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],

  // ✅ Redirection logic
  redirect: (context, state) {
    final container = ProviderScope.containerOf(context);
    final authState = container.read(authStateProvider);

    // While loading, don’t redirect
    if (authState.isLoading) return null;

    final isLoggedIn = authState.value != null;
    final loggingIn =
        state.matchedLocation == '/login' || state.matchedLocation == '/signup';

    if (!isLoggedIn && !loggingIn) {
      return '/login';
    }
    if (isLoggedIn && loggingIn) {
      return '/dashboard';
    }
    return null;
  },
);
