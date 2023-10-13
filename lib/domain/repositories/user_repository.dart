import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/domain/entities/user.dart';

abstract class UserRepository {
  // API methods
  Future<DataState<List<UserEntity>>> getUsers();
}
