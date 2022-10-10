import 'package:equatable/equatable.dart';

class Task extends Equatable {

  final String id;
  final String title;
  final String description;
  final String date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;

  Task({required this.title,required this.description, required this.id, this.isDone, this.isDeleted, this.isFavorite, required this.date,}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith({
    String? id,
    String? title,
    String? description,
    String? date,
    bool? isDone,
    bool? isDeleted,
    bool? isFavorite,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'description': this.description,
      'date': this.date,
      'isDone': this.isDone,
      'isDeleted': this.isDeleted,
      'isFavorite': this.isFavorite,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      isDone: map['isDone'] as bool,
      isDeleted: map['isDeleted'] as bool,
      isFavorite: map['isFavorite'] as bool,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    date,
    isDone,
    isDeleted,
    isFavorite
  ];

}
