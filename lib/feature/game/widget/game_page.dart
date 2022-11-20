import 'package:auto_route/auto_route.dart';
import 'package:equati/feature/game/provider/single_game_provider.dart';
import 'package:equati/feature/game/widget/game_panel_widget.dart';
import 'package:equati/shared/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key, @PathParam('id') required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(singleGameProvider);

    return state.when(
      loading: LoadingWidget.new,
      gameLoaded: GamePanelWidget.new,
      error: (error) => Text(error.toString()),
    );
  }
}
