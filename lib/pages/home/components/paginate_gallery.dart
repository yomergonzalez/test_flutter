import 'package:animation/bloc/pagination/bloc.dart';
import 'package:animation/functions.dart';
import 'package:animation/pages/home/components/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginateGallery extends StatefulWidget {
  @override
  _PaginateGalleryState createState() => _PaginateGalleryState();
}

class _PaginateGalleryState extends State<PaginateGallery> {
  ScrollController _scrollController;
  PaginationBloc _pagination;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _pagination = BlocProvider.of<PaginationBloc>(context);
    _pagination.getPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaginationBloc, PaginationState>(
      listener: (BuildContext cont, PaginationState st) {
        Functions.showAlert(context, AlertType.INFO, "Nuevos elementos cargados");
      },
        builder: (context, state) {
            if (state is InitialPaginationState) {
              return progressIndicator();
            }
            if (state is FailedPaginationState){
              return failedMessage();
            }
            if (state.photos.isEmpty) {
              return emptyMessage();
            }
            return buildGridView(state);
        }
    );
  }

  Center emptyMessage() {
    return Center(
      child: Text('Sin Fotos', style: TextStyle(fontSize: 20),),
    );
  }

  Center failedMessage() {
    return Center(
      child: Text('Ha ocurrido un error', style: TextStyle(fontSize: 20),),
    );
  }

  GridView buildGridView(PaginationState state) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return PhotoView(photo: state.photos[index]);
      },
      itemCount: state.photos.length,
      controller: _scrollController,
    );
  }



  /// PROGRESS INDICATOR
  Center progressIndicator() => Center(
          child: Container(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(),
      ));

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _pagination.getMorePhotos();
    }
  }
}
