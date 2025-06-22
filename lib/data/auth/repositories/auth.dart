import 'package:dartz/dartz.dart';
import 'package:movie_app/data/auth/models/signup_req_parms.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignupReqParms parms) async {
    return await sl<AuthApiService>().signup(parms);
  }
}
