import 'dart:async';
import 'package:animation/services/gallery_service.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  @override
  PaginationState get initialState => InitialPaginationState();
  GalleryService _galleryService = GalleryService();
  int _page  = 1;

  Future<void> getPhotos() async {
    try {
      var photos = await _galleryService.getPhotos(_page);
      add(LoadingMorePagination(photos.data));
    } catch (e) {
      add(ErrorPagination('No se ha podido cargar'));
    }
  }
  Future<void> getMorePhotos() async {
    _page++;
    getPhotos();
  }

  Future<void> resetPhotos() async {
    _page = 1;
    add(ResetPagination());
    getPhotos();
  }

  @override
  Stream<PaginationState> mapEventToState(PaginationEvent event) async* {

    print(event);
    if (event is LoadingMorePagination) {
      yield SuccessPaginationState(state.photos + event.data);
    }

    if(event is ErrorPagination){
      yield FailedPaginationState();
    }
    if(event is ResetPagination){
      yield InitialPaginationState();
    }

  }
}
