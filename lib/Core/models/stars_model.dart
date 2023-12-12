import 'package:equatable/equatable.dart';

class StarsModel extends Equatable {
  final String? title;

  const StarsModel({this.title});

  factory StarsModel.fromJson(Map<String, dynamic> json) {
    return StarsModel(title: json['title'] ?? "");
  }
  @override
  List<Object> get props => [title!];
}
