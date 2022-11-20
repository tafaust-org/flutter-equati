import 'package:equati/feature/game/provider/dailychallenge_provider.dart';
import 'package:equati/feature/game/widget/game_panel_widget.dart';
import 'package:equati/shared/http/app_exception.dart';
import 'package:equati/shared/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailyChallengePage extends ConsumerWidget {
  const DailyChallengePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dailyChallengeProvider);

    return state.when(
      loading: LoadingWidget.new,
      gameLoaded: GamePanelWidget.new,
      error: (AppException error) => Text(error.toString()),
    );
  }
}
