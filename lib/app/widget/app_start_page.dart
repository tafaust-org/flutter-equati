import 'package:auto_route/auto_route.dart';
import 'package:equati/app/provider/app_start_provider.dart';
import 'package:equati/l10n/l10n.dart';
import 'package:equati/shared/widget/connection_unavailable_widget.dart';
import 'package:equati/shared/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStartPage extends ConsumerWidget {
  const AppStartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStartProvider);

    return state.maybeWhen(
      initial: () => const LoadingWidget(),
      authenticated: () => _buildContent(context),
      //const HomePage(),
      // unauthenticated: SignInPage.new,
      internetUnAvailable: () => const ConnectionUnavailableWidget(),
      orElse: () => const LoadingWidget(),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(context.l10n.startAppBarTitle),
        leading: const AutoLeadingButton(),
      ),
      body: const AutoRouter(),
    );
  }

// AutoTabsScaffold _buildAutoTabsScaffold() {
//   return AutoTabsScaffold(
//     appBarBuilder: (context, tabsRouter) {
//       return AppBar(
//       backgroundColor: Colors.blueGrey,
//       title: Text(context.l10n.game),
//       leading: const AutoLeadingButton(),
//     );
//     },
//     routes: const [
//       HomeRoute(),
//       ScoreboardRoute(),
//     ],
//     bottomNavigationBuilder: (_, tabsRouter) {
//       return BottomNavigationBar(
//         currentIndex: tabsRouter.activeIndex,
//         onTap: tabsRouter.setActiveIndex,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.videogame_asset),
//             label: 'Games',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.score),
//             label: 'Highscore',
//           ),
//         ],
//       );
//     },
//     // builder: (context, child, animation) => const AutoRouter(),
//   );
// }
}
