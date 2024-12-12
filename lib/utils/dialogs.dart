import 'package:flutter/material.dart';

import '../core/l18n/strings.g.dart';

class Dialogs {
  final BuildContext context;

  Dialogs.of(this.context);

  Future<void> showFirstLaunchDialog() async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  strings.firstLaunchDialog.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            ],
          ),
          content: Text(strings.firstLaunchDialog.content),
        );
      },
    );
  }
}

extension ContextExt on BuildContext {
  Dialogs get dialogs => Dialogs.of(this);
}
