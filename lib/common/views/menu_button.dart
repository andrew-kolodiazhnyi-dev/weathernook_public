import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/l18n/strings.g.dart';
import '../../core/router/app_router.gr.dart';
import '../../core/router/router.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  void _onSetLocationTap() {
    router.pushSearchPage();
  }

  void _onSettingsTap() {
    router.pushSettingsPage();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
        side: BorderSide(color: Theme.of(context).colorScheme.secondary),
      ),
      icon: FaIcon(
        FontAwesomeIcons.bars,
        color: Theme.of(context).colorScheme.primary,
      ),
      itemBuilder: (context) {
        return [
          if (router.appRouter.current.name != SearchRoute.name)
            PopupMenuItem(
              onTap: _onSetLocationTap,
              padding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 10,
              ),
              child: Text(
                strings.homePage.setLocationMenuItem,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                ),
              ),
            ),
          PopupMenuItem(
            onTap: _onSettingsTap,
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 10,
            ),
            child: Text(
              strings.homePage.settingsMenuItem,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
              ),
            ),
          ),
        ];
      },
    );
  }
}
