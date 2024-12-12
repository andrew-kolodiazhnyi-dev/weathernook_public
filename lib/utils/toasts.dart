import 'package:flutter/material.dart';

class Toasts {
  final BuildContext context;

  Toasts.of(this.context);

  SnackBar _buildSnackBar({
    required String message,
    TextAlign textAlign = TextAlign.center,
    Widget? icon,
    SnackBarAction? action,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return SnackBar(
      backgroundColor: backgroundColor,
      action: action,
      dismissDirection: DismissDirection.endToStart,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      elevation: 8,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          if (icon != null) ...[
            icon,
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              message,
              textAlign: textAlign,
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
    );
  }

  void showSuccess({
    required String message,
  }) {
    final snackBar = _buildSnackBar(
      icon: Icon(
        Icons.check_circle_rounded,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      message: message,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showError(String error) {
    final snackBar = _buildSnackBar(
      icon: Icon(
        Icons.error_outline,
        color: Theme.of(context).colorScheme.onError,
      ),
      message: error,
      textColor: Theme.of(context).colorScheme.onError,
      backgroundColor: Theme.of(context).colorScheme.error,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

extension ContextExt on BuildContext {
  Toasts get toasts => Toasts.of(this);
}
