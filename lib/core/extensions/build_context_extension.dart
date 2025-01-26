import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension StringsLocalizationsX on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this)!;
}

extension FocusX on BuildContext {
  void clearFocus() => FocusScope.of(this).unfocus();

  static void clearPrimaryFocus() => FocusManager.instance.primaryFocus?.unfocus();
}

extension MediaQueryX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get topPadding => mediaQuery.padding.top;

  double get bottomPadding => mediaQuery.padding.bottom;

  double get screenWidth => mediaQuery.size.width;

  double get screenHeight => mediaQuery.size.height;
}

extension DialogX on BuildContext {
  Future<T?> showGeneralDialog<T>({
    required Widget child,
  }) {
    return showDialog<T>(
      context: this,
      builder: (_) => child,
    );
  }
}

extension ModalBottomSheetX on BuildContext {
  Future<T?> showGeneralBottomSheet<T>({
    required Widget child,
    bool enableDrag = true,
    BoxConstraints? constraints,
    bool isDismissible = true,
    bool useRootNavigator = true,
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      useRootNavigator: useRootNavigator,
      isScrollControlled: isScrollControlled,
      enableDrag: enableDrag,
      constraints: constraints,
      isDismissible: isDismissible,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (_) => child,
    );
  }
}
