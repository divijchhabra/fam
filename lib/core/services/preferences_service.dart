import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String _reminderPrefix = 'reminder_';
  static const String _dismissPrefix = 'dismiss_';

  Future<SharedPreferences> _getPreferences() async {
    return await SharedPreferences.getInstance();
  }

  // Reminder related functions
  Future<bool> setReminderStatus(String cardId, bool value) async {
    final preferences = await _getPreferences();
    return preferences.setBool('$_reminderPrefix$cardId', value);
  }

  Future<bool?> getReminderStatus(String cardId) async {
    final preferences = await _getPreferences();
    return preferences.getBool('$_reminderPrefix$cardId');
  }

  Future<bool> clearReminderStatus(String cardId) async {
    final preferences = await _getPreferences();
    return preferences.remove('$_reminderPrefix$cardId');
  }

  // Dismiss related functions
  Future<bool> setDismissStatus(String cardId, bool value) async {
    final preferences = await _getPreferences();
    return preferences.setBool('$_dismissPrefix$cardId', value);
  }

  Future<bool?> getDismissStatus(String cardId) async {
    final preferences = await _getPreferences();
    return preferences.getBool('$_dismissPrefix$cardId');
  }

  Future<bool> clearDismissStatus(String cardId) async {
    final preferences = await _getPreferences();
    return preferences.remove('$_dismissPrefix$cardId');
  }
} 