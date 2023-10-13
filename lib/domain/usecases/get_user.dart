import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/app/util/usecase.dart';
import 'package:ai_client/domain/repositories/user_repository.dart';
import 'package:ai_client/domain/entities/user.dart';

class GetUserUseCase implements UseCase<DataState<List<UserEntity>>,void>{
  
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);
  
  @override
  Future<DataState<List<UserEntity>>> call({void params}) {
    return _userRepository.getUsers();
  }
  
}
