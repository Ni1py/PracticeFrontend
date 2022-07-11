import '../lib/class_person.dart';
import '../lib/class_list_person.dart';
import 'dart:io';

void writeCommands() {
    stdout.writeln('Commands: \n-show\n-add\n-delete\n-find\n-getPersonMaxAge\n-exit');
}

String readPersonName() {
    stdout.write('> Enter the person''s name: ');
    String name = stdin.readLineSync() ?? '';
    while (name == '') {
      stdout.writeln('You did not enter a name!');
      stdout.write('> Enter the person''s name: ');
      name = stdin.readLineSync() ?? '';
    }
    return name;
}

int readPersonAge() {
    stdout.write('> Enter the age of the person: ');
    String str = stdin.readLineSync() ?? '';
    int age = int.tryParse(str) ?? 0;
    while (age <= 0) {
      stdout.writeln('You entered an incorrect age!');
      stdout.write('> Enter the age of the person: ');
      str = stdin.readLineSync() ?? '';
      age = int.tryParse(str) ?? 0;
    }
    return age;
}

String readPersonPosition() {
    stdout.write('> Enter the position of the person: ');
    String position = stdin.readLineSync() ?? '';

    while ((position != 'single') && (position != 'married')) {
      stdout.writeln('You entered an incorrect position!');
      stdout.writeln('Possible positions: single or married');
      stdout.write('> Enter the position of the person: ');
      position = stdin.readLineSync() ?? '';
    }
    return position;
}

String readCountryOfBirth() {
    stdout.write('> Enter the person''s country of birth: ');
    String countryOfBirth = stdin.readLineSync() ?? '';
    while (countryOfBirth == '') {
      stdout.writeln('You did not enter the country of birth of the person!');
      stdout.write('> Enter the person''s country of birth: ');
      countryOfBirth = stdin.readLineSync() ?? '';
    }
    return countryOfBirth;
}

int readIndex(ListPerson list) {
  stdout.write('> Enter the number of the item you want to delete (beginning with 1): ');
  String str = stdin.readLineSync() ?? '';
  if (list.length() == 0) {
    stdout.writeln('The array is empty! You can''t delete an element!');
    return -1;
  }
  else {
    int index = int.tryParse(str) ?? 0;
    while (index < 1 || index > list.length()) {
      stdout.writeln('You entered an incorrect index!');
      stdout.writeln('Item range 1 to ${list.length()}!');
      stdout.write('> Enter the number of the item you want to delete (beginning with 1): ');
      str = stdin.readLineSync() ?? '';
      index = int.tryParse(str) ?? 0;
    }
    return index;
  }
  
}

void show(ListPerson list) {
  var localList = list.getList();
  if (localList.isEmpty) {
    stdout.writeln('[]');
  }
  else {
    for (int i = 0; i < localList.length; i++) {
      stdout.writeln('${i + 1} element: ');
      localList[i].getInfo();
    }
  }
}

void find(ListPerson list, String name) {
  Person person = list.findPersonWithName(name);
  if (person.name == '') {
    stdout.writeln('There is no user with this name');
  }
  else {
    person.getInfo();
  }
}

void main(List<String> arguments) {
  String command = '';
  String name = '';
  int age = 0;
  String position = '';
  String countryOfBirth = '';
  ListPerson list = ListPerson();
  writeCommands();
  while(command != 'exit') {
    stdout.write('> Enter the command: ');
    command = stdin.readLineSync() ?? '';

    switch(command) {
      case 'show':
        show(list);
        break;

      case 'add':
        name = readPersonName();
        age = readPersonAge();
        position = readPersonPosition();
        countryOfBirth = readCountryOfBirth();
        Person person = Person(name, age, position, countryOfBirth);
        list.add(person);
        break;

      case 'delete':
        int index = readIndex(list) - 1;
        list.delete(index);
        break;

      case 'find':
        stdout.write('Enter the name of the person you want to find: ');
        String str = stdin.readLineSync() ?? '';
        find(list, str);
        break;

      case 'getPersonMaxAge':
        Person person = list.getPersonMaxAge();
        if (person.name == '') {
          stdout.writeln('Command execution is impossible! The array is empty');
        }
        else {
          person.getInfo();
        }
        break;

      case 'exit': break;

      default:
        stdout.writeln('You entered the wrong command!');
        stdout.writeln('Enter from the list below');
        writeCommands();
        break;
    }
  }
}
