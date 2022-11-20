import 'package:auto_route/auto_route.dart';
import 'package:equati/l10n/l10n.dart';
import 'package:equati/shared/route/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _widgetContent(context, ref);
  }

  Widget _widgetContent(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Expanded(child: Center(child: Text('Logo'))),
        Flexible(
          child: OutlinedButton(
            onPressed: () {
              context.router.navigate(const GameSelectionRoute());
            },
            child: Text(context.l10n.appStartPage_button_play),
          ),
        ),
        // TODO feature: settings
        // Flexible(
        //   child: OutlinedButton(
        //     onPressed: () {
        //       context.router.navigate(const SettingsRoute());
        //     },
        //     child: Text(context.l10n.appStartPage_button_settings),
        //   ),
        // ),
      ],
    );
  }
}
