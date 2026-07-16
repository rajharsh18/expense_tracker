/// Formats grain/weight values stored as integer grams.
class WeightFormatter {
  WeightFormatter._();

  static double toDisplayKg(int grams) => grams / 1000.0;

  static int toStorageGrams(double kg) => (kg * 1000).round();

  static String format(int grams) {
    final kg = toDisplayKg(grams);
    if (kg == kg.roundToDouble()) {
      return '${kg.toStringAsFixed(0)} kg';
    }
    return '${kg.toStringAsFixed(2)} kg';
  }
}
