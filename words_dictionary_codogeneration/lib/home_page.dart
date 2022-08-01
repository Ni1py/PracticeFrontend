import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/country_flags.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';
import 'package:words_dictionary_codogeneration/data/topic_color_containers.dart';
import 'package:words_dictionary_codogeneration/data/topic_text.dart';
import 'package:words_dictionary_codogeneration/data/topic_text_service.dart';
import 'package:words_dictionary_codogeneration/data/topic_theme.dart';
import 'package:words_dictionary_codogeneration/language_filters_state.dart';
import 'package:words_dictionary_codogeneration/print_words_provider.dart';
import 'package:words_dictionary_codogeneration/style.dart';
import 'package:words_dictionary_codogeneration/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/word_adding_provider.dart';
import 'package:words_dictionary_codogeneration/words_list.dart';

part 'home_page.g.dart';

@swidget
Widget homePage(BuildContext context) {
  return ContainerBackground(
    Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 56,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ButtonAdd(),
              ButtonDelete(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WordLanguageDropdownField(),
              TranslationLanguageDropdownField(),
              PrintButton(),
            ],
          ),
          const SizedBox(
            height: 56,
          ),
          const WordsList(),
        ],
      ),
    ),
  );
}

@hcwidget
Widget myAlertDialog(BuildContext context, WidgetRef ref) {
  final wordRu = useState('');
  final wordEn = useState('');
  final wordGe = useState('');
  final wordFr = useState('');

  return AlertDialog(
    backgroundColor: ref.watch(topicThemeProvider).topicBackgroundColor,
    titleTextStyle: TextStyle(
        fontSize: fontSize,
        color: ref.watch(topicThemeProvider).topicTextColor),
    title: Text(topicDialogTitleText.translations[
            ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
        ''),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AlertDialogTextField(
            topicInputRuText, ((String text) => wordRu.value = text)),
        const SizedBox(
          height: 20,
        ),
        AlertDialogTextField(
            topicInputEnText, ((String text) => wordEn.value = text)),
        const SizedBox(
          height: 20,
        ),
        AlertDialogTextField(
            topicInputGeText, ((String text) => wordGe.value = text)),
        const SizedBox(
          height: 20,
        ),
        AlertDialogTextField(
            topicInputFrText, ((String text) => wordFr.value = text)),
      ],
    ),
    actions: [
      TextButton(
        child: const Text('OK'),
        onPressed: () => {
          Navigator.pop(context, 'OK'),
          ref
              .read(wordAddingProvider.notifier)
              .addWord(wordRu.value, wordEn.value, wordGe.value, wordFr.value),
        },
      ),
      TextButton(
        child: Text(topicCancelButtonText.translations[
                ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
            ''),
        onPressed: () => {
          Navigator.pop(
              context,
              topicCancelButtonText.translations[
                      ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
                  ''),
        },
      ),
    ],
  );
}

@cwidget
Widget buttonAdd(BuildContext context, WidgetRef ref) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const MyAlertDialog();
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

@cwidget
Widget buttonDelete(BuildContext context, WidgetRef ref) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: ElevatedButton(
      onPressed: () {
        ref
            .read(printProvider.notifier)
            .removeWord(ref.watch(wordAddingProvider).words.length);
        ref.read(wordAddingProvider.notifier).deleteWord();
      },
      child: Text(
        topicDeleteButtonText.translations[
                ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
            '',
        style: const TextStyle(fontSize: fontSize),
      ),
    ),
  );
}

@cwidget
Widget alertDialogTextField(BuildContext context, WidgetRef ref,
    TopicText hintContent, Function(String)? onChanged) {
  return TextField(
    style: TextStyle(color: ref.watch(topicThemeProvider).topicTextColor),
    decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ref.watch(topicThemeProvider).topicTextColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ref.watch(topicThemeProvider).topicTextColor, width: 1),
        ),
        hintText: hintContent.translations[
                ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
            '',
        hintStyle:
            TextStyle(color: ref.watch(topicThemeProvider).topicTextColor),
        fillColor: ref.watch(topicThemeProvider).topicColor,
        filled: true),
    onChanged: onChanged,
  );
}

@cwidget
Widget containerBackground(BuildContext context, WidgetRef ref, Widget child) {
  return Container(
    color: ref.watch(topicThemeProvider).topicColor,
    child: child,
  );
}

@cwidget
Widget topicColorDropDownField(BuildContext context, WidgetRef ref) {
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

@cwidget
Widget topicLanguageDropDownField(BuildContext context, WidgetRef ref) {
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

@cwidget
Widget printButton(BuildContext context, WidgetRef ref) {
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
        : ref.watch(printProvider).printWords(
            ref.watch(languageFiltersProvider),
            ref.watch(wordAddingProvider).words)),
    child: Text(
        '${topicPrintText.translations[ref.watch(topicLanguageFiltersProvider).topicLanguage]}$wordsLengthString'),
  );
}

@cwidget
Widget wordLanguageDropdownField(BuildContext context, WidgetRef ref) {
  return LanguageDropdownField(
    topicWordText.translations[
            ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
        '',
    ref.watch(languageFiltersProvider).wordLanguage,
    (Language value) => ref
        .read(languageFiltersProvider.notifier)
        .update((state) => LanguageFiltersModel(
              value,
              state.translationLanguage,
            )),
  );
}

@cwidget
Widget translationLanguageDropdownField(BuildContext context, WidgetRef ref) {
  return LanguageDropdownField(
    topicTranslationText.translations[
            ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
        '',
    ref.watch(languageFiltersProvider).translationLanguage,
    (Language value) => ref
        .read(languageFiltersProvider.notifier)
        .update((state) => LanguageFiltersModel(
              state.wordLanguage,
              value,
            )),
  );
}

@cwidget
Widget languageDropdownField(BuildContext context, WidgetRef ref, String label,
    Language value, ValueChanged<Language> onChanged) {
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
                  child: Text(ref
                      .watch(topicLanguageFiltersProvider)
                      .topicLanguages[value.index]),
                ))
            .toList(),
      ),
    ],
  );
}
