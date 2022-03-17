import 'dart:async';

import 'package:bloc/bloc.dart';
import 'bloc_repository_of_profile.dart';
import '../../../data/models/models/local/profile_view/validation_models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final BlocRepositoryOfProfile _blocRepositoryOfProfile;
  ProfileBloc({required BlocRepositoryOfProfile repository})
      : _blocRepositoryOfProfile = repository,
        super(const ProfileState()) {
    on<NameChanged>(_onNameChanged);
    on<SurnameChanged>(_onSurnameChanged);
    on<UsernameChanged>(_onUsernameChanged);
    on<PermissionChanged>(_onPermissionChanged);
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<EmailChanged>(_onEmailChanged);
    on<ProfileSubmitted>(_onProfileSubmitted);
  }

  FutureOr<void> _onNameChanged(
    NameChanged event,
    Emitter<ProfileState> emit,
  ) {}

  FutureOr<void> _onSurnameChanged(
    SurnameChanged event,
    Emitter<ProfileState> emit,
  ) {}

  FutureOr<void> _onUsernameChanged(
    UsernameChanged event,
    Emitter<ProfileState> emit,
  ) {}

  FutureOr<void> _onPermissionChanged(
    PermissionChanged event,
    Emitter<ProfileState> emit,
  ) {}

  FutureOr<void> _onPhoneNumberChanged(
    PhoneNumberChanged event,
    Emitter<ProfileState> emit,
  ) {}

  FutureOr<void> _onEmailChanged(
    EmailChanged event,
    Emitter<ProfileState> emit,
  ) {}

  FutureOr<void> _onProfileSubmitted(
    ProfileSubmitted event,
    Emitter<ProfileState> emit,
  ) async {
    await _blocRepositoryOfProfile.profileSubmitted();
  }

  @override
  Future<void> close() {
    _blocRepositoryOfProfile.close();
    return super.close();
  }
}
