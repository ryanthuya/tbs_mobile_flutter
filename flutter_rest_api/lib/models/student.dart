

class Student {
  final int id;
  final String name;
  final int age;

  Student({required this.id, required this.name, required this.age});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'age': age,
  };

  // @override
  // String toString() {
  //   return Student
  //         {
  //           id: $id,
  //           name: $name,
  //           age: $age
  //         }
  //       ;
  // }
}