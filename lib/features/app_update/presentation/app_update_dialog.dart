import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/di/locator.dart';
import '../../../core/l18n/strings.g.dart';
import '../../../core/router/router.dart';

Uri get _getPlayStoreUrl => Uri.parse(
    'https://play.google.com/store/apps/details?id=${locator<PackageInfo>().packageName}');

Uri get _getAppStoreUrl => Uri.parse('https://apps.apple.com/app/id6738587410');

Future<void> _onPressed() async {
  if (defaultTargetPlatform == TargetPlatform.android) {
    await launchUrl(_getPlayStoreUrl);
  } else if (defaultTargetPlatform == TargetPlatform.iOS) {
    await launchUrl(_getAppStoreUrl);
  }
}

final GlobalKey appUpdateDialogKey = GlobalKey();

Future<void> showAppUpdateDialog([bool required = false]) async {
  final context = router.appRouter.navigatorKey.currentState?.context;
  if (context != null) {
    return await showDialog(
      context: context,
      barrierDismissible: !required,
      builder: (context) {
        return AlertDialog(
          key: appUpdateDialogKey,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  required
                      ? strings.appUpdate.titleRequired
                      : strings.appUpdate.titleSuggested,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              if (!required)
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
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                required
                    ? strings.appUpdate.textRequired
                    : strings.appUpdate.textSuggested,
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: _onPressed,
                child: Text(strings.appUpdate.updateNowButton),
              ),
            ],
          ),
        );
      },
    );
  }
}
