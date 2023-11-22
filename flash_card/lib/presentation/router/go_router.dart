import 'package:flash_card/presentation/widgets/main_widgets/sentence.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flash_card/presentation/pages/my_page.dart';
import 'package:flash_card/presentation/widgets/main_widgets/vocabulary_book.dart';
import 'package:flash_card/presentation/router/page_path.dart';

/// Provide GoRouter
final goRouterProvider = Provider(
  (ref) {
    final routes = [
      GoRoute(
        path: PageId.flash.path,
        name: PageId.flash.routeName,
        builder: (context, state) {
          return const MyPage();
        },
      ),
      GoRoute(
        path: PageId.vocab.path,
        name: PageId.vocab.routeName,
        builder: (context, state) {
          return const VocabularyBook();
        },
      ),
      GoRoute(
        path: PageId.sentence.path,
        name: PageId.sentence.routeName,
        builder: (context, state) {
          return const Sentence();
        },
      ),
    ];

    return GoRouter(
      initialLocation: PageId.flash.path,
      debugLogDiagnostics: false,
      routes: routes,
    );
  },
);
