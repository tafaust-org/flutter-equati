import 'package:auto_route/auto_route.dart';
import 'package:equati/feature/game/model/game.dart';
import 'package:equati/feature/game/provider/games_provider.dart';
import 'package:equati/feature/game/provider/single_game_provider.dart';
import 'package:equati/l10n/l10n.dart';
import 'package:equati/shared/http/app_exception.dart';
import 'package:equati/shared/route/router.gr.dart';
import 'package:equati/shared/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class GameSelectionPage extends ConsumerWidget {
  const GameSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _widgetContent(context, ref);
  }

  Widget _widgetContent(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gamesProvider);

    return state.when(
      loading: LoadingWidget.new,
      gamesLoaded: (List<Game> games) {
        return RefreshIndicator(
          onRefresh: () async {
            await ref.read(gamesProvider.notifier).refetchGames();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  '${context.l10n.gameSelectionPage_title}:',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              // OutlinedButton(
              //   onPressed: () {
              //     context.router.push(const DailyChallengeRoute());
              //   },
              //   child:
              //       Text(context.l10n.gameSelectionPage_button_dailyChallenge),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  onTap: () {
                    context.router.push(const DailyChallengeRoute());
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        context.l10n.gameSelectionPage_button_dailyChallenge,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // OutlinedButton(
              //   onPressed: null,
              //   child: Text(context.l10n.gameSelectionPage_button_timeTrial),
              // ),
              // OutlinedButton(
              //   onPressed: null,
              //   child: Text(context.l10n.gameSelectionPage_button_custom),
              // ),
              Flexible(child: DecoratedGameList(games, ref)),
            ],
          ),
        );
      },
      error: (AppException error) {
        return Text(error.toString()); // FIXME
      },
    );
  }
}

class DecoratedGameList extends StatelessWidget {
  const DecoratedGameList(this.games, this.ref, {super.key});

  final WidgetRef ref;
  final List<Game> games;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(15),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: games
          .where((game) => game.dailyChallenge == null)
          .toList()
          .toList()
          .asMap()
          .entries
          .map(
            (entries) {
              return DecoratedGridGameBox(
                entries.value,
                entries.key + 1,
                ref,
              );
            },
          )
          .toList(growable: true)
          .reversed
          .toList(),
    );
  }
}

class DecoratedGridGameBox extends StatelessWidget {
  const DecoratedGridGameBox(this.game, this.index, this.ref, {super.key});

  final WidgetRef ref;
  final Game game;
  final int index;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;

    return InkWell(
      onTap: () {
        ref.read(singleGameProvider.notifier).fetchGameById(game.id);
        context.router.push(GameRoute(id: game.id));
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (game.dailyChallenge != null)
              Text(
                'Daily Challenge ${DateFormat.yMd(locale).format(
                  game.dailyChallenge!,
                )}',
                textAlign: TextAlign.center,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.fade,
              )
            else
              Text('Game $index'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: game.source
                  .map(
                    (double source) => DecoratedGridItemBox(
                      source.toInt().toString(),
                    ),
                  )
                  .toList(growable: false),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: game.operations.map(DecoratedGridItemBox.new).toList()
                ..add(
                  DecoratedGridItemBox(
                    game.target.toInt().toString(),
                    boxColor: Colors.deepOrange,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

class DecoratedGridItemBox extends StatelessWidget {
  const DecoratedGridItemBox(
    this.item, {
    super.key,
    this.textColor,
    this.boxColor = Colors.black,
  });

  final String item;
  final Color? textColor;
  final Color boxColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          color: boxColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Text(
        item,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
