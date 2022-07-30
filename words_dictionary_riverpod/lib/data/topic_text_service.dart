import 'package:words_dictionary_riverpod/data/language.dart';
import 'package:words_dictionary_riverpod/data/topic_text.dart';

final topicWordText = TopicText(
  translations: {
    Language.english: 'Word language:',
    Language.french: 'Langue des mots:',
    Language.german: 'Sprache der Wörter:',
    Language.russian: 'Язык слов:',
  },
);
final topicTranslationText = TopicText(
  translations: {
    Language.english: 'Translation language:',
    Language.french: 'Langue de traduction:',
    Language.german: 'Sprache der Übersetzung:',
    Language.russian: 'Язык перевода:',
  },
);

final topicPrintText = TopicText(
  translations: {
    Language.english: 'Print',
    Language.french: 'Imprimer',
    Language.german: 'Drucken',
    Language.russian: 'Напечатать',
  },
);

final topicText = TopicText(
  translations: {
    Language.english: 'words',
    Language.french: 'mots',
    Language.german: 'wörter',
    Language.russian: 'слова',
  },
);

final topicAddButtonText = TopicText(
  translations: {
    Language.english: 'Add a word',
    Language.french: 'Ajouter un mot',
    Language.german: 'Ein Wort hinzufügen',
    Language.russian: 'Добавить слово',
  },
);

final topicDeleteButtonText = TopicText(
  translations: {
    Language.english: 'Delete word',
    Language.french: 'Supprimer le mot',
    Language.german: 'Wort löschen',
    Language.russian: 'Удалить слово',
  },
);

final topicDialogTitleText = TopicText(
  translations: {
    Language.english: 'Adding the word',
    Language.french: 'En ajoutant le mot',
    Language.german: 'Hinzufügen des Wortes',
    Language.russian: 'Добавление слова',
  },
);

final topicInputRuText = TopicText(
  translations: {
    Language.english: 'Enter the Russian version',
    Language.french: 'Entrez la version russe',
    Language.german: 'Eingabe der russischen Version',
    Language.russian: 'Введите русскую версию',
  },
);

final topicInputEnText = TopicText(
  translations: {
    Language.english: 'Enter the English version',
    Language.french: 'Entrer la version anglaise',
    Language.german: 'Eingabe der englischen Fassung',
    Language.russian: 'Введите английскую версию',
  },
);

final topicInputGeText = TopicText(
  translations: {
    Language.english: 'Enter the German version',
    Language.french: 'Entrer la version allemande',
    Language.german: 'Eingabe der deutschen Version',
    Language.russian: 'Введите немецкую версию',
  },
);

final topicInputFrText = TopicText(
  translations: {
    Language.english: 'Enter the French version',
    Language.french: 'Entrer la version française',
    Language.german: 'Eingabe der französischen Version',
    Language.russian: 'Введите французскую версию',
  },
);

final topicCancelButtonText = TopicText(
  translations: {
    Language.english: 'Cancel',
    Language.french: 'Annulez',
    Language.german: 'Abbrechen',
    Language.russian: 'Отмена',
  },
);
