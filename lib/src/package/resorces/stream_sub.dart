import 'dart:async';
import 'package:flutter/material.dart';

mixin StreamSubscriptionMixin<State> {
  @protected
  final List<StreamSubscription> _subscriptions = [];

  void addSubscription(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }

  void addSubscriptions(List<StreamSubscription> subscriptions) {
    _subscriptions.addAll(subscriptions);
  }

  void cancelAllSubscriptions() {
    if (_subscriptions.isEmpty) return;
    for (final element in _subscriptions) {
      element.cancel();
    }
  }
}
