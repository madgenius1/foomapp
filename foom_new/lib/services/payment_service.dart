import 'dart:async';

/// Simulated Payment Service for deposits/withdrawals
/// Later integrate with MPesa, PayPal, Stripe, or direct MMF APIs.
class PaymentService {
  Future<bool> deposit(int amount) async {
    await Future.delayed(const Duration(seconds: 1));
    return true; // Simulate success
  }

  Future<bool> withdraw(int amount) async {
    await Future.delayed(const Duration(seconds: 1));
    return true; // Simulate success
  }
}
