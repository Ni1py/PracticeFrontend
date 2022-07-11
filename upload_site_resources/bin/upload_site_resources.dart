import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:upload_site_resources/upload_site_resources.dart';

Future main(List<String> arguments) async {
  if (arguments.length > 1 || arguments.length < 1) {
    print('You didn''t put in enough or many arguments!');
    print('Usage: file.exe <url>');
    return;
  }
  if (arguments[0] == '') {
    print('The argument cannot be empty!');
    return;
  }
  final result = await upload(http.Client(), arguments[0]);
  stdout.writeln(result);
}
