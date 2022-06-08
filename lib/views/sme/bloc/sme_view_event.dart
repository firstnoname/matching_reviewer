part of 'sme_view_bloc.dart';

@immutable
abstract class SmeViewEvent {}

class SmeViewEventInitial extends SmeViewEvent {}

class SmeViewEventGetProductList extends SmeViewEvent {}

class SmeViewEventSubmitProduct extends SmeViewEvent {}
