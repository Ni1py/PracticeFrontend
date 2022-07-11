class Person {
  String name;
  int age;
  String position;
  String _countryOfBirth;

  Person(this.name, this.age, this.position, this._countryOfBirth);

  String getCountryOfBirth() {
    return _countryOfBirth;
  }

  void getInfo() {
    print('- 1. Name: $name\n- 2. Age: $age\n- 3. Position: $position\n- 4. Country of birth: $_countryOfBirth');
  }
}
