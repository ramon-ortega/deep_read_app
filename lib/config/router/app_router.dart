import 'package:go_router/go_router.dart';

import 'package:deep_read_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = state.pathParameters['page'] ?? '0';
        return HomeScreen(
          pageIndex: int.parse(pageIndex),
        );
      },
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
    GoRoute(path: '/', redirect: (_, __) => '/home/0'),
  ],
);
