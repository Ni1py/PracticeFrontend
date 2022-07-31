import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/country_flags.dart';
import 'package:words_dictionary_riverpod/data/language.dart';
import 'package:words_dictionary_riverpod/data/topic_color_containers.dart';
import 'package:words_dictionary_riverpod/data/topic_text_service.dart';
import 'package:words_dictionary_riverpod/data/topic_theme.dart';
import 'package:words_dictionary_riverpod/language_filters_state.dart';
import 'package:words_dictionary_riverpod/print_words_provider.dart';
import 'package:words_dictionary_riverpod/style.dart';
import 'package:words_dictionary_riverpod/topic_language_filters_provider.dart';
import 'package:words_dictionary_riverpod/topic_theme_filters_provider.dart';
import 'package:words_dictionary_riverpod/word_adding_provider.dart';
import 'package:words_dictionary_riverpod/words_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ContainerBackground(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: WordAddingProvider(
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
    );
  }
}

class _ButtonAdd extends ConsumerWidget {
  const _ButtonAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelWordAdding = WordAddingInheritedNotifier.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor:
                    ref.watch(topicThemeProvider).topicBackgroundColor,
                titleTextStyle: TextStyle(
                    fontSize: fontSize,
                    color: ref.watch(topicThemeProvider).topicTextColor),
                title: Text(topicDialogTitleText.translations[ref
                        .watch(topicLanguageFiltersProvider)
                        .topicLanguage] ??
                    ''),
                content: _TranslationEntryFields(
                  modelWordAdding: modelWordAdding,
                  modelTopicLanguage: ref.watch(topicLanguageFiltersProvider),
                  modelTopicColor: ref.watch(topicThemeProvider),
                ),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () => {
                      Navigator.pop(context, 'OK'),
                      modelWordAdding.addWord(),
                      modelWordAdding.clear()
                    },
                  ),
                  TextButton(
                    child: Text(topicCancelButtonText.translations[ref
                            .watch(topicLanguageFiltersProvider)
                            .topicLanguage] ??
                        ''),
                    onPressed: () => {
                      Navigator.pop(
                          context,
                          topicCancelButtonText.translations[ref
                                  .watch(topicLanguageFiltersProvider)
                                  .topicLanguage] ??
                              ''),
                      modelWordAdding.clear()
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Text(
          topicAddButtonText.translations[
                  ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
              '',
          style: const TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}

class _ButtonDelete extends ConsumerWidget {
  const _ButtonDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = WordAddingInheritedNotifier.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ElevatedButton(
        onPressed: () => model.deleteWord(),
        child: Text(
          topicDeleteButtonText.translations[
                  ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
              '',
          style: const TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}

class _TranslationEntryFields extends StatelessWidget {
  const _TranslationEntryFields(
      {Key? key,
      required this.modelWordAdding,
      required this.modelTopicLanguage,
      required this.modelTopicColor})
      : super(key: key);

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
                borderSide:
                    BorderSide(color: modelTopicColor.topicTextColor, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: modelTopicColor.topicTextColor, width: 1),
              ),
              hintText: topicInputRuText
                      .translations[modelTopicLanguage.topicLanguage] ??
                  '',
              hintStyle: TextStyle(color: modelTopicColor.topicTextColor),
              fillColor: modelTopicColor.topicColor,
              filled: true),
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
              borderSide:
                  BorderSide(color: modelTopicColor.topicTextColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: modelTopicColor.topicTextColor, width: 1),
            ),
            hintText: topicInputEnText
                    .translations[modelTopicLanguage.topicLanguage] ??
                '',
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
              borderSide:
                  BorderSide(color: modelTopicColor.topicTextColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: modelTopicColor.topicTextColor, width: 1),
            ),
            hintText: topicInputGeText
                    .translations[modelTopicLanguage.topicLanguage] ??
                '',
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
              borderSide:
                  BorderSide(color: modelTopicColor.topicTextColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: modelTopicColor.topicTextColor, width: 1),
            ),
            hintText: topicInputFrText
                    .translations[modelTopicLanguage.topicLanguage] ??
                '',
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

class _ContainerBackground extends ConsumerWidget {
  const _ContainerBackground({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: ref.watch(topicThemeProvider).topicColor,
      child: child,
    );
  }
}

class _TopicColorDropDownField extends ConsumerWidget {
  const _TopicColorDropDownField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const SizedBox(width: 24),
        DropdownButton<TopicTheme>(
          value: ref.watch(topicThemeProvider).topicTheme,
          elevation: 16,
          underline: const SizedBox(), //DropdownButtonHideUnderline
          onChanged: (TopicTheme? newValue) {
            if (newValue != null) {
              ref.read(topicThemeProvider.notifier).topicTheme(newValue);
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

class _TopicLanguageDropDownField extends ConsumerWidget {
  const _TopicLanguageDropDownField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const SizedBox(width: 24),
        DropdownButton<Language>(
          value: ref.watch(topicLanguageFiltersProvider).topicLanguage,
          elevation: 16,
          underline: const SizedBox(), //DropdownButtonHideUnderline
          onChanged: (Language? newValue) {
            if (newValue != null) {
              ref
                  .read(topicLanguageFiltersProvider.notifier)
                  .topicLanguage(newValue);
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

class _PrintButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordIds = ref.watch(printProvider).wordIds;
    final wordsLength = wordIds.length;
    final wordsLengthString = wordsLength == 0
        ? ''
        : ' $wordsLength ${topicText.translations[ref.watch(topicLanguageFiltersProvider).topicLanguage]}';

    return TextButton(
      style: TextButton.styleFrom(
        primary: ref.watch(topicThemeProvider).topicTextColor,
        textStyle: const TextStyle(fontSize: fontSize),
      ),
      onPressed: () => ((wordsLength == 0)
          ? null
          : ref
              .watch(printProvider)
              .printWords(ref.watch(languageFiltersProvider))),
      child: Text(
          '${topicPrintText.translations[ref.watch(topicLanguageFiltersProvider).topicLanguage]}$wordsLengthString'),
    );
  }
}

class _WordLanguageDropdownField extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _LanguageDropdownField(
      value: ref.watch(languageFiltersProvider).wordLanguage,
      onChanged: (Language value) => ref
          .read(languageFiltersProvider.notifier)
          .update((state) => LanguageFiltersModel(
                value,
                state.translationLanguage,
              )),
      label: topicWordText.translations[
              ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
          '',
    );
  }
}

class _TranslationLanguageDropdownField extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _LanguageDropdownField(
      value: ref.watch(languageFiltersProvider).translationLanguage,
      onChanged: (Language value) => ref
          .read(languageFiltersProvider.notifier)
          .update((state) => LanguageFiltersModel(
                state.wordLanguage,
                value,
              )),
      label: topicTranslationText.translations[
              ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
          '',
    );
  }
}

class _LanguageDropdownField extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {

    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: fontSize,
              color: ref.watch(topicThemeProvider).topicTextColor),
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
                    child: Text(ref.watch(topicLanguageFiltersProvider).topicLanguages[value.index]),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
