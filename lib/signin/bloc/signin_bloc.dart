import 'package:bloc/bloc.dart';
import 'package:bloc_form_validation/signin/bloc/signin_event.dart';
import 'package:bloc_form_validation/signin/bloc/signin_state.dart';
import 'package:email_validator/email_validator.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
SignInBloc(): super(SignInInitialState()){
  on<SignInTextChangedEvent>((event, emit) {
    if(EmailValidator.validate(event.emailValue)==false){
      emit(SignInErrorState("Please Enter a valid email address"));
    }
    else if(event.passwordValue.length<8){
      emit(SignInErrorState("Please enter a valid password"));
    }
    else{
      emit(SignInValidState());
    }
  });

  on<SignInSubmittedEvent>((event, emit) {
    emit(SignInLoadingState());
  });
}
}