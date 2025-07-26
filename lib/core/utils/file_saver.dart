// lib/utils/file_saver.dart

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  final directory = await getApplicationDocumentsDirectory();
  final path = '${directory.path}/$fileName';

  final file = File(path);
  await file.writeAsBytes(bytes, flush: true);

  // Opens the file using the default app on desktop or mobile
  await OpenFile.open(path);
}
