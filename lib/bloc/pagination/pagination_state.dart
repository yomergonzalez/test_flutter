import 'package:animation/services/models/photo.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PaginationState {
  final List<Photo> photos = [];
  final int page = 1;
}

class InitialPaginationState extends PaginationState {}

class SuccessPaginationState extends PaginationState {
  final List<Photo> photos;
  SuccessPaginationState(this.photos);
}

class FailedPaginationState extends PaginationState {}

