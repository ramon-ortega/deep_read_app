import 'package:go_router/go_router.dart';

import 'package:deep_read_app/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
    routes: [
      GoRoute(
        path: 'book/:id',
        name: BookScreen.name,
        builder: (context, state) {
          final bookId = state.pathParameters['id'] ?? 'no-id';

          return BookScreen(
            bookId: bookId,
          );
        },
      ),
    ],
  ),
]);
