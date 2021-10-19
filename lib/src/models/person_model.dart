class Person {
  final String id;
  final String name;
  final String lastName;
  final String document;

  Person({
    required this.id,
    required this.name,
    required this.lastName,
    required this.document,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'lastName': lastName, 'document': document};
  }

  @override
  String toString() {
    return 'Person{id: $id, name: $name, lastName: $lastName, document: $document}';
  }
}
