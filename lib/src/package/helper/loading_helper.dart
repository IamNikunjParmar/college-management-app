import 'package:flutter/material.dart';

abstract class LoadingHandler {
  const LoadingHandler();

  void startLoading();

  void stopLoading();

  void handleLoading(bool loading) {
    if (loading) {
      startLoading();
    } else {
      stopLoading();
    }
  }
}

class LoadingDialogHandler extends LoadingHandler {
  LoadingDialogHandler({
    required BuildContext context,
  }) : _context = context;

  final BuildContext _context;
  Route? _dialogRoute;

  Widget _buildDialog(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Route _buildDialogRoute() {
    return RawDialogRoute(
      barrierDismissible: false,
      pageBuilder: (buildContext, animation, secondaryAnimation) {
        Widget dialog = SafeArea(
          child: Builder(builder: _buildDialog),
        );

        return dialog;
      },
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
          child: child,
        );
      },
    );
  }

  @override
  void startLoading() {
    if (_dialogRoute != null) return;
    _dialogRoute = _buildDialogRoute();
    Navigator.maybeOf(_context)?.push(_dialogRoute!);
  }

  @override
  void stopLoading() {
    if (_dialogRoute != null) Navigator.maybeOf(_context)?.removeRoute(_dialogRoute!);
    _dialogRoute = null;
  }
}
