import '../../../../core/resources/hive_manager.dart';
import '../../../models/dtos/remote/dbh_api/topics/settings/user_dto.dart';
import 'package:hive/hive.dart';

class UserHiveManager extends IHiveManager<UserDto> {
  UserHiveManager(String key) : super(key);

  @override
  Future<void> addItems(List<UserDto> items) async {
    await box?.addAll(items);
  }

  @override
  Future<void> putItems(List<UserDto> items) async {
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  UserDto? getItem(String key) {
    return box?.get(key);
  }

  @override
  Future<void> putItem(String key, UserDto item) async {
    await box?.put(key, item);
  }

  @override
  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  @override
  List<UserDto>? getValues() {
    return box?.values.toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.userTypeId)) {
      Hive.registerAdapter(UserDtoAdapter());
    }
  }
}
