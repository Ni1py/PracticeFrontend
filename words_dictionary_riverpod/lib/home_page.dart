import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/country_flags.dart';
import 'package:words_dictionary_riverpod/data/language.dart';
import 'package:words_dictionary_riverpod/data/topic_color_containers.dart';
import 'package:words_dictionary_riverpod/data/topic_text_service.dart';
import 'package:words_dictionary_riverpod/data/topic_theme.dart';
import 'package:words_dictionary_riverpod/language_filters_state.dart';
//import 'package:words_dictionary_riverpod/print_words_provider.dart';
import 'package:words_dictionary_riverpod/style.dart';
import 'package:words_dictionary_riverpod/topic_language_filters_provider.dart';
import 'package:words_dictionary_riverpod/topic_theme_filters_provider.dart';
import 'package:words_dictionary_riverpod/word_adding_provider.dart';
import 'package:words_dictionary_riverpod/words_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TopicThemeFiltersProvider(
      child: _ContainerBackground(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
            child: WordAddingProvider(
              child: TopicLanguageFiltersProvider(
                //child: PrintWordsProvider(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _TopicLanguageDropDownField(),
                          _TopicColorDropDownField(),
                        ],
                      ),
                      const SizedBox(
                        height: 56,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _ButtonAdd(),
                          _ButtonDelete(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _WordLanguageDropdownField(),
                          _TranslationLanguageDropdownField(),
                          _PrintButton(),
                        ],
                      ),
                      const SizedBox(
                        height: 56,
                      ),
                      const WordsList(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        //),
    );
  }
}

class _ButtonAdd extends StatelessWidget {
  const _ButtonAdd({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final modelWordAdding = WordAddingInheritedNotifier.of(context);
    final modelTopicLanguage = TopicLanguageFiltersInheritedNotifier.of(context);
    final modelTopicColor = TopicThemeFiltersInheritedNotifier.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () { showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: modelTopicColor.topicBackgroundColor,
              titleTextStyle: TextStyle(fontSize: fontSize, color: modelTopicColor.topicTextColor),
              title: Text(topicDialogTitleText.translations[modelTopicLanguage.topicLanguage] ?? ''),
              content: _TranslationEntryFields(
                modelWordAdding: modelWordAdding, 
                modelTopicLanguage: modelTopicLanguage,
                modelTopicColor: modelTopicColor,
              ),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () => {Navigator.pop(context, 'OK'), modelWordAdding.addWord(), modelWordAdding.clear()},
                ),
                TextButton(
                  child: Text(topicCancelButtonText.translations[modelTopicLanguage.topicLanguage] ?? ''),
                  onPressed: () => {
                    Navigator.pop(
                      context, 
                      topicCancelButtonText.translations[modelTopicLanguage.topicLanguage] ?? ''
                    ), 
                    modelWordAdding.clear()
                  },
                ),
              ],
            );
          },
        );}, 
        child: Text(
          topicAddButtonText.translations[modelTopicLanguage.topicLanguage] ?? '', 
          style: const TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}

class _ButtonDelete extends StatelessWidget {
  const _ButtonDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = WordAddingInheritedNotifier.of(context);
    final modelTopicLanguage = TopicLanguageFiltersInheritedNotifier.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ElevatedButton(
        onPressed: () => model.deleteWord(), 
        child: Text(
          topicDeleteButtonText.translations[modelTopicLanguage.topicLanguage] ?? '',
          style: const TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}

class _TranslationEntryFields extends StatelessWidget {
  const _TranslationEntryFields({
    Key? key, 
    required this.modelWordAdding, 
    required this.modelTopicLanguage,
    required this.modelTopicColor
  }) : super(key: key);

  final WordAddingModel modelWordAdding;
  final TopicLanguageFiltersModel modelTopicLanguage;
  final TopicThemeFiltersModel modelTopicColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          style: TextStyle(color: modelTopicColor.topicTextColor),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: modelTopicColor.topicTextColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: modelTopicColor.topicTextColor, width: 1),
            ),
            hintText: topicInputRuText.translations[modelTopicLanguage.topicLanguage] ?? '',
            hintStyle: TextStyle(color: modelTopicColor.topicTextColor),
            fillColor: modelTopicColor.topicColor,
            filled: true
          ),
          onChanged: (text) {
            modelWordAdding.wordRu = text;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          style: TextStyle(color: modelTopicColor.topicTextColor),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: modelTopicColor.topicTextColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: modelTopicColor.topicTextColor, width: 1),
            ),
            hintText: topicInputEnText.translations[modelTopicLanguage.topicLanguage] ?? '',
            hintStyle: TextStyle(color: modelTopicColor.topicTextColor),
            fillColor: modelTopicColor.topicColor,
            filled: true,
          ),
          onChanged: (text) {
            modelWordAdding.wordEn = text;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          style: TextStyle(color: modelTopicColor.topicTextColor),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: modelTopicColor.topicTextColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: modelTopicColor.topicTextColor, width: 1),
            ),
            hintText: topicInputGeText.translations[modelTopicLanguage.topicLanguage] ?? '',
            hintStyle: TextStyle(color: modelTopicColor.topicTextColor),
            fillColor: modelTopicColor.topicColor,
            filled: true,
          ),
          onChanged: (text) {
            modelWordAdding.wordGe = text;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          style: TextStyle(color: modelTopicColor.topicTextColor),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: modelTopicColor.topicTextColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: modelTopicColor.topicTextColor, width: 1),
            ),
            hintText: topicInputFrText.translations[modelTopicLanguage.topicLanguage] ?? '',
            hintStyle: TextStyle(color: modelTopicColor.topicTextColor),
            fillColor: modelTopicColor.topicColor,
            filled: true,
          ),
          onChanged: (text) {
            modelWordAdding.wordFr = text;
          },
        ),
      ],
    );
  }

}

class _ContainerBackground extends StatelessWidget {
  const _ContainerBackground({Key? key, required this.child}) : super(key: key);

  final Widget child;
  
  @override
  Widget build(BuildContext context) {
    final model = TopicThemeFiltersInheritedNotifier.of(context);

    return Container(
      color: model.topicColor,
      child: child,
    );
  }
}

class _TopicColorDropDownField extends StatelessWidget {
  const _TopicColorDropDownField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = TopicThemeFiltersInheritedNotifier.of(context);

    return Row(
      children: [
        const SizedBox(width: 24),
        DropdownButton<TopicTheme>(
          value: model.topicTheme,
          elevation: 16,
          underline: const SizedBox(), //DropdownButtonHideUnderline
          onChanged: (TopicTheme? newValue) {
            if (newValue != null) {
              model.topicTheme = newValue;
            }
          },
          items: TopicTheme.values
              .map((TopicTheme value) => DropdownMenuItem<TopicTheme>(
                    value: value,
                    child: topicColorContainers[value.index],
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _TopicLanguageDropDownField extends StatelessWidget {
  const _TopicLanguageDropDownField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = TopicLanguageFiltersInheritedNotifier.of(context);

    return Row(
      children: [
        const SizedBox(width: 24),
        DropdownButton<Language>(
          value: model.topicLanguage,
          elevation: 16,
          underline: const SizedBox(), //DropdownButtonHideUnderline
          onChanged: (Language? newValue) {
            if (newValue != null) {
              model.topicLanguage = newValue;
            }
          },
          items: Language.values
              .map((Language value) => DropdownMenuItem<Language>(
                    value: value,
                    child: countryFlags[value.index],
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _PrintButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final model = PrintWordsInheritedNotifier.of(context);
    final modelTopic = TopicLanguageFiltersInheritedNotifier.of(context);
    final modelTopicColor = TopicThemeFiltersInheritedNotifier.of(context);
    //final wordIds = model.wordIds;
    //final wordsLength = wordIds.length;
    //final wordsLengthString = wordsLength == 0 ? '' : ' $wordsLength ${topicText.translations[modelTopic.topicLanguage]}';

    return TextButton(
      style: TextButton.styleFrom(
        primary: modelTopicColor.topicTextColor,
        textStyle: const TextStyle(fontSize: fontSize),
      ),
      onPressed: /*wordsLength*/0 == 0 ? () {} : (){}/*model.printWords*/,
      child: Text('${topicPrintText.translations[modelTopic.topicLanguage]}0'), //заместо 0 - $wordsLengthString
    );
  }
}

class _WordLanguageDropdownField extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelTopic = TopicLanguageFiltersInheritedNotifier.of(context);

    return _LanguageDropdownField(
      value: ref.watch(languageFiltersProvider).wordLanguage,
      onChanged: (Language value) => ref
                    .read(languageFiltersProvider.notifier)
                    .update((state) => LanguageFiltersModel(
                              state.wordLanguage = value, 
                              state.translationLanguage,
                    )), //model.wordLanguage = value,
      label: topicWordText.translations[modelTopic.topicLanguage] ?? '',
    );
  }
}

class _TranslationLanguageDropdownField extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelTopic = TopicLanguageFiltersInheritedNotifier.of(context);

    return _LanguageDropdownField(
      value: ref.watch(languageFiltersProvider).translationLanguage,
      onChanged: (Language value) => ref
                    .read(languageFiltersProvider.notifier)
                    .update((state) => LanguageFiltersModel(
                              state.wordLanguage, 
                              state.translationLanguage = value,
                    )), //model.wordLanguage = value,
      label: topicTranslationText.translations[modelTopic.topicLanguage] ?? '',
    );
  }
}

class _LanguageDropdownField extends StatelessWidget {
  const _LanguageDropdownField({
    required this.value,
    required this.onChanged,
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;
  final Language value;
  final ValueChanged<Language> onChanged;

  @override
  Widget build(BuildContext context) {
    final modelTopicColor = TopicThemeFiltersInheritedNotifier.of(context);
    final modelTopicLanguage = TopicLanguageFiltersInheritedNotifier.of(context);

    return Row(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: fontSize, color: modelTopicColor.topicTextColor),
        ),
        const SizedBox(width: 24),
        DropdownButton<Language>(
          value: value,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple, fontSize: fontSize),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (Language? newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
          items: Language.values
              .map((Language value) => DropdownMenuItem<Language>(
                    value: value,
                    child: Text(modelTopicLanguage.topicLanguages[value.index]),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
