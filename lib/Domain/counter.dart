import 'package:equatable/equatable.dart';

class Counter extends Equatable {
  int value = 0;



  @override
  // TODO: implement props
  List<Object> get props => [value];
}