import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';

import 'package:http/http.dart' as http;

Future<String> upload(http.Client httpClient, String url) async {
  var nameRoot = url.replaceFirst('https://', '');
  nameRoot = nameRoot.replaceFirst('/', '');
  Directory Root = new Directory('./$nameRoot');
  final dirRoot = await Root.create(recursive: false);

  //index.html
  final uri = Uri.parse(url);
  final response = await httpClient.get(uri);
  final indexHtml = await File('./$nameRoot/index.html').create();
  await indexHtml.writeAsBytes(response.bodyBytes);
  
  //.js
  Directory files = new Directory('./$nameRoot/${nameRoot}_files');
  final dirFiles = await files.create(recursive: false);
  final document = parse(response.body);
  List<Element> js = document.querySelectorAll('script');
  js.removeWhere((element) => element.attributes['src'] == null);
  for (var element in js) {
    var src = element.attributes['src'] ?? '';
    var uriJs = Uri.parse('');
    var name = '';
    if (src[0] == '/') {
      name = src.replaceFirst('/', '');
      uriJs = Uri.parse('$url$src');
      var listStr = name.split('.');
      name = '';
      for (int i = 0; i < listStr.length; i++) {
        if (i < listStr.length - 2) {
          name += listStr[i] + '-';
        }
        else if (i == listStr.length - 2){
          name += listStr[i];
        }
      }
      name = name.replaceAll('/', '-');
      name = name.replaceAll('.', '-');
    }
    else {
      uriJs = Uri.parse(src);
      name = src.replaceFirst('https://', '');
      var listStr = name.split('?');
      name = listStr[0];
      if (name.contains('.js', 0)) {
        name = name.replaceFirst('.js', '');
      }
      else if (name.contains('/js', 0)) {
        name = name.replaceFirst('/js', '');
      }
      name = name.replaceAll('.', '-');
      name = name.replaceAll('/', '-');
    }
    final responseJs = await httpClient.get(uriJs);
    final jsFile = await File('./$nameRoot/${nameRoot}_files/$name.js').create();
    await jsFile.writeAsBytes(responseJs.bodyBytes);
  }

  //.css, .png, .svg, .webmanifest
  List<Element> cssAndImage = document.querySelectorAll('link');
  cssAndImage.removeWhere((element) => element.attributes['href'] == null);
  for (var element in cssAndImage) {
    var href = element.attributes['href'] ?? '';
    var uriCssImage = Uri.parse('');
    var extension = '';
    var name = '';
    if (href[0] == '/') {
      uriCssImage = Uri.parse('$url$href');
      name = href.replaceFirst('/', '');
      var listStr = name.split('.');
      name = '';
      extension = '';
      for (int i = 0; i < listStr.length; i++) {
        if (i < listStr.length - 2) {
          name += listStr[i] + '-';
        }
        else if (i == listStr.length - 2){
          name += listStr[i];
        }
        if (i == listStr.length - 1) {
          switch (listStr[i][0]) {
            case 's':
              extension = '.svg';
              break;
            case 'p':
              extension = '.png';
              break;
            case 'c':
              extension = '.css';
              break;
            case 'w':
              extension = '.webmanifest';
              break;
          }
        }
      }
      name = name.replaceAll('/', '-');
      name = name.replaceAll('.', '-');
    }
    else {
      continue;
    }
    name = name.replaceAll('/', '-');
    name = name.replaceAll('.', '-');

    final responseJs = await httpClient.get(uriCssImage);
    final CssImageFile = await File('./$nameRoot/${nameRoot}_files/$name$extension').create();
    await CssImageFile.writeAsBytes(responseJs.bodyBytes);
  }

  return 'Ok';
}
