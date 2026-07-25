import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Transaction list filters — persist across in-app navigation; cleared on app background.
class TransactionFilters {
  const TransactionFilters({
    this.typeFilter = 'all',
    this.accountId,
    this.category,
    this.paymentMode,
  });

  final String typeFilter;
  final int? accountId;
  final String? category;
  final String? paymentMode;

  bool get hasAdvancedFilter =>
      accountId != null || category != null || paymentMode != null;

  TransactionFilters copyWith({
    String? typeFilter,
    int? accountId,
    String? category,
    String? paymentMode,
    bool clearAccountId = false,
    bool clearCategory = false,
    bool clearPaymentMode = false,
  }) {
    return TransactionFilters(
      typeFilter: typeFilter ?? this.typeFilter,
      accountId: clearAccountId ? null : accountId ?? this.accountId,
      category: clearCategory ? null : category ?? this.category,
      paymentMode: clearPaymentMode ? null : paymentMode ?? this.paymentMode,
    );
  }
}

class TransactionFiltersNotifier extends StateNotifier<TransactionFilters> {
  TransactionFiltersNotifier() : super(const TransactionFilters());

  void setTypeFilter(String type) {
    state = state.copyWith(typeFilter: type);
  }

  void setAccountId(int? accountId) {
    state = accountId == null
        ? state.copyWith(clearAccountId: true)
        : state.copyWith(accountId: accountId);
  }

  void applyAdvanced({
    int? accountId,
    String? category,
    String? paymentMode,
  }) {
    state = TransactionFilters(
      typeFilter: state.typeFilter,
      accountId: accountId,
      category: category,
      paymentMode: paymentMode,
    );
  }

  void clearAdvanced() {
    state = state.copyWith(
      clearAccountId: true,
      clearCategory: true,
      clearPaymentMode: true,
    );
  }

  void reset() {
    state = const TransactionFilters();
  }
}

final transactionFiltersProvider =
    StateNotifierProvider<TransactionFiltersNotifier, TransactionFilters>(
  (ref) => TransactionFiltersNotifier(),
);
