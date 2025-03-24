import 'package:get_it/get_it.dart';
import 'package:movies/features/auth_feature/data/repo/auth_repo.dart';
import 'package:movies/features/auth_feature/presentation/controller/register_controller/register_cubit.dart';
import 'package:movies/features/browse_feature/data/repo/browse_repo.dart';
import 'package:movies/features/home_feature/data/repo/home_view_repo.dart';
import 'package:movies/features/profile_feature/data/repo/profile_repo.dart';
import '../../features/auth_feature/presentation/controller/login_controller/login_cubit.dart';
import '../../features/browse_feature/presentation/controller/browse_controller/browse_cubit.dart';
import '../../features/browse_feature/presentation/controller/movies_category_controller/movies_category_cubit.dart';
import '../../features/details_feature/data/repo/details_repo.dart';
import '../../features/details_feature/presentation/controller/cast_controller/cast_cubit.dart';
import '../../features/details_feature/presentation/controller/details_controller/details_cubit.dart';
import '../../features/details_feature/presentation/controller/similar_controller/similar_cubit.dart';
import '../../features/favorites_feature/data/repo/favorites_repo.dart';
import '../../features/favorites_feature/presentation/controller/add_favorites/add_favorites_cubit.dart';
import '../../features/favorites_feature/presentation/controller/get_favorites/get_favorites_cubit.dart';
import '../../features/home_feature/presentation/controller/available_new_controller/available_new_cubit.dart';
import '../../features/home_feature/presentation/controller/top_rated_controller/top_rated_cubit.dart';
import '../../features/home_feature/presentation/controller/upcoming_controller/upcoming_cubit.dart';
import '../../features/home_service_feature/presentation/controller/home_service_cubit.dart';
import '../../features/onboarding_feature/presentation/controller/on_boarding_cubit.dart';
import '../../features/profile_feature/presentation/controller/profile_cubit.dart';
import '../../features/search_feature/data/repo/browse_repo.dart';
import '../../features/search_feature/presentation/controller/search_cubit.dart';
import '../api/api_service.dart';

final GetIt sl = GetIt.instance;

class ServiceLocator {
  void setup() {
    /// API service
    sl.registerLazySingleton<ApiService>(() => ApiService());
    sl.registerLazySingleton<AuthApiService>(() => AuthApiService());

    /// repos
    sl.registerLazySingleton<HomeViewRepo>(() => HomeViewRepo(sl()));
    sl.registerLazySingleton<BrowseRepo>(() => BrowseRepo(sl()));
    sl.registerLazySingleton<DetailsRepo>(() => DetailsRepo(sl()));
    sl.registerLazySingleton<SearchRepo>(() => SearchRepo(sl()));
    sl.registerLazySingleton<AuthRepo>(() => AuthRepo(sl()));
    sl.registerLazySingleton<ProfileRepo>(() => ProfileRepo(sl()));
    sl.registerLazySingleton<FavoritesRepo>(() => FavoritesRepo(sl()));

    ////Cubits

    sl.registerFactory<OnBoardingCubit>(() => OnBoardingCubit());
    sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
    sl.registerFactory<RegisterCubit>(() => RegisterCubit(sl()));
    sl.registerFactory<HomeServiceCubit>(() => HomeServiceCubit());
    sl.registerFactory<AvailableNewCubit>(() => AvailableNewCubit(sl()));
    sl.registerFactory<BrowseCubit>(() => BrowseCubit(sl()));
    sl.registerFactory<MoviesCategoryCubit>(() => MoviesCategoryCubit(sl()));
    sl.registerFactory<DetailsCubit>(() => DetailsCubit(sl()));
    sl.registerFactory<CastCubit>(() => CastCubit(sl()));
    sl.registerFactory<SimilarCubit>(() => SimilarCubit(sl()));
    sl.registerFactory<SearchCubit>(() => SearchCubit(sl()));
    sl.registerFactory<TopRatedCubit>(() => TopRatedCubit(sl()));
    sl.registerFactory<UpcomingCubit>(() => UpcomingCubit(sl()));
    sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl()));
    sl.registerFactory<GetFavoritesCubit>(() => GetFavoritesCubit(sl()));
    sl.registerFactory<AddFavoritesCubit>(() => AddFavoritesCubit(sl()));
  }
}
