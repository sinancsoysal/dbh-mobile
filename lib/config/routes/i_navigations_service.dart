abstract class INavigationService {
  Future<void> navigateToPage<T extends Object?>(
      {required String path, T? data});

  Future<void> navigateToPageClear<T extends Object?>(
      {required String path, T? data});
}
