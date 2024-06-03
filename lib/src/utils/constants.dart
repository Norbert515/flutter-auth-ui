import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

SizedBox spacer(double height) {
  return SizedBox(
    height: height,
  );
}

/// Set of extension methods to easily display a snackbar
extension ShowSnackBar on BuildContext {
  /// Displays a basic snackbar
  void showSnackBar(
    String message, {
    Color? textColor,
    Color? backgroundColor,
    String? actionLabel,
  }) {

    ShadToaster.of(this).show(
      ShadToast(
        backgroundColor: backgroundColor,
        description: Text(
          message,
          style: textColor == null ? null : TextStyle(color: textColor),
        ),
      ),
    );
  }

  /// Displays a red snackbar indicating error
  void showErrorSnackBar(
    String message, {
    String? actionLabel,
  }) {
    ShadToaster.of(this).show(
      ShadToast.destructive(
        description: Text(message),
        action: ShadButton.destructive(
          text: const Text('Ok'),
          onPressed: () => ShadToaster.of(this).hide(),
        ),
      ),
    );
    showSnackBar(
      message,
      textColor: Theme.of(this).colorScheme.onErrorContainer,
      backgroundColor: Theme.of(this).colorScheme.errorContainer,
      actionLabel: actionLabel,
    );
  }
}
