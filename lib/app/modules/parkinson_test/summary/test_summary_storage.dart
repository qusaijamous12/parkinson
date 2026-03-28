import '../../../shared/helper/shared_pref_helper.dart';

class TestSummaryStorage {
  static const String _summaryKey = 'test_summary_scores';

  static const Map<String, double> _defaults = {
    'physical': 0,
    'emotional': 0,
    'cognitive': 0,
    'tremor': 0,
    'memory': 0,
    'voice': 0,
  };

  static Map<String, double> loadScores() {
    final raw = SharedPrefHelper.getJson(key: _summaryKey);
    final scores = <String, double>{..._defaults};
    if (raw != null) {
      for (final entry in raw.entries) {
        final value = entry.value;
        if (value is num) {
          scores[entry.key] = value.toDouble().clamp(0.0, 1.0).toDouble();
        }
      }
    }
    return scores;
  }

  static Future<void> saveScores(Map<String, double> updatedScores) async {
    final merged = <String, double>{...loadScores(), ...updatedScores};
    await SharedPrefHelper.saveJson(value: merged, key: _summaryKey);
  }
}
