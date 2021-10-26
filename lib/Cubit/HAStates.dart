abstract class HAStates{

}
class InitialStates extends HAStates{

}
class LoadingReceivingResultStates extends HAStates{

}
class ReceivingResultStates extends HAStates{

}
class ErrorReceivingResultStates extends HAStates{
  final String error;
  ErrorReceivingResultStates(this.error);
}

class BottomNavigationBarIndexChanged extends HAStates{

}
class SetControllerListState extends HAStates{

}
class SignupLoadingStates extends HAStates{}
class SignupSuccessStates extends HAStates{}
class SignupErrorStates extends HAStates{}

class LoginLoadingStates extends HAStates{}
class LoginSuccessStates extends HAStates{}
class LoginErrorStates extends HAStates{}

class CreateDataBase extends HAStates{}
class OpenDataBase extends HAStates{}
class ErrorCreateDataBase extends HAStates{}
class InsertInDataBase extends HAStates{}
class LoadingDataBase extends HAStates{}
class ErrorInsetrtingInDataBase extends HAStates{}
class ReadFromDataBase extends HAStates{}

class LoadingReceivingStoredResultStates extends HAStates{}

