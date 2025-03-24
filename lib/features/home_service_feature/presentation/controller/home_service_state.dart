part of 'home_service_cubit.dart';
sealed class HomeServiceState {}

final class HomeServiceInitial extends HomeServiceState {}
final class NavigationState extends HomeServiceState {}
class HomeState extends HomeServiceState {}
class SearchState extends HomeServiceState {}
class CategoryState extends HomeServiceState {}
class ProfileState extends HomeServiceState {}