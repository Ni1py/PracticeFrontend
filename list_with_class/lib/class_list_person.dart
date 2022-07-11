import 'class_person.dart';

class ListPerson {
  List<Person> list = [];

  List<Person> getList() {
    return list;
  }

  void add(Person person) {
    list.add(person);
  }

  bool delete(int index) {
    if (list.isEmpty) {
      return false;
    }
    else {
      list.removeAt(index);
      return true;
    }
  }

  int length() {
    return list.length;
  }

  Person findPersonWithName(String name) {
    Person person = Person('', 0, '', '');
    for (int i = 0; i < list.length; i++) {
      if (list[i].name == name) {
        person = list[i];
        break;
      }
    }
    return person;
  }

  Person getPersonMaxAge() {
    if (!list.isEmpty) {
      int max = list[0].age;
      int index = 0;
      for (int i = 0; i < list.length; i++) {
        if (list[i].age > max) {
          max = list[i].age;
          index = i;
        }
      }
      return list[index];
    }
    else {
      return Person('', 0, '', '');
    }
  }
}