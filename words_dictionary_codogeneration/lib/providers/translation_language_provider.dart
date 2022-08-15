import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';

final translationLanguageProvider = StateProvider((_) => Language.english);
