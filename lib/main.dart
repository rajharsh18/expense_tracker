import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'core/constants/app_constants.dart';
import 'data/database/app_database.dart';
import 'data/database/database_holder.dart';
import 'presentation/providers/app_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  await _ensureNotebookFileExists();

  final holder = DatabaseHolder();
  await holder.open();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        databaseHolderProvider.overrideWithValue(holder),
      ],
      child: const ExpenseTrackerApp(),
    ),
  );
}

/// Ensures an empty notebook_db.db exists for CashBook backup compatibility.
Future<void> _ensureNotebookFileExists() async {
  final docsDir = await AppDatabase.getDocumentsDirectory();
  final notebookPath = p.join(docsDir, AppConstants.notebookDbName);
  final notebook = File(notebookPath);
  if (!await notebook.exists()) {
    await notebook.create(recursive: true);
  }
}
