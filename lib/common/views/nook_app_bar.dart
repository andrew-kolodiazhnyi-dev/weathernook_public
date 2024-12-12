import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/router/app_router.gr.dart';
import '../../core/router/router.dart';
import 'menu_button.dart';

class NookAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget> actions;

  const NookAppBar({
    super.key,
    this.title,
    this.actions = const [],
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: title ?? const SizedBox.shrink(),
              ),
              ...actions,

              ///Check if it is a HomePage or SearchPage and
              ///that it is the only one in the stack.
              if (router.appRouter.current.name == HomeRoute.name ||
                  (router.appRouter.current.name == SearchRoute.name &&
                      router.appRouter.stack.length == 1))
                const MenuButton(),
              if (router.canPop())
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => router.maybePop(),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: FaIcon(
                      FontAwesomeIcons.xmark,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
