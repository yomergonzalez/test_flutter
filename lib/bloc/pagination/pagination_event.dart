import 'package:animation/services/models/photo.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PaginationEvent {}

class ResetPagination extends PaginationEvent {}

class LoadingMorePagination  extends PaginationEvent {
  final List<Photo> data;
  LoadingMorePagination(this.data);
}

class ErrorPagination  extends PaginationEvent {
  final String message;
  ErrorPagination(this.message);
}

