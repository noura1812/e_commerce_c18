import 'package:bloc/bloc.dart';
import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/auth/domain/entity/user_entity.dart';
import 'package:e_commerce_c18/features/auth/domain/usecase/login_usecase.dart';
import 'package:e_commerce_c18/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:injectable/injectable.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginUsecase, this._signupUsecase) : super(AuthInitialState());
  final LoginUsecase _loginUsecase;
  final SignUpUsecase _signupUsecase;

  login(String email, String password) async {
    emit(LoginLoadingState());
    CustomResponse<UserEntity> response = await _loginUsecase(
      UserEntity(email: email, password: password),
    );
    switch (response) {
      case Success<UserEntity>():
        emit(LoginSuccessState(userEntity: response.data));
      case Failure<UserEntity>():
        emit(LoginFailureState(failure: response));
    }
  }

  signup() {}
}
