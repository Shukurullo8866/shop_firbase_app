import 'package:bloc/bloc.dart';

import 'package:shop_firbase_app/data/repositories/users_repository.dart';
import 'package:equatable/equatable.dart';
import '../../data/model/user_model.dart';

part 'user_state.dart';

class UserBloc extends Cubit<UserSingleState> {
  final UsersRepository userRepository;

  UserBloc({required this.userRepository})
      : super(
          UserSingleState(
            userModel: UserModel(
                age: 0,
                createdAt: '',
                docId: '',
                email: '',
                fcmToken: '',
                fullName: '',
                imageUrl: '',
                userId: ''),
          ),
        ) {
    _fetchSingleUser(userId: userModel!.userId);
  }

  UserModel? userModel;

  _fetchSingleUser({required String userId}) async {
    userRepository.getSingleUser(userId).listen((users) {
      emit(state.copyWith(userModel: users.first));
    });
  }
}
