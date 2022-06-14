import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_template/src/features/core/domain/exceptions/app_exception.dart';

// ignore_for_file: one_member_abstracts
/// UseCase interface for use cases that takes a
@immutable
abstract class UseCase<Type, Params> {
  // states that we can call an implementation of AppUseCase as a function,
  // i.e. AppUseCase(t, params)
  Future<Either<AppException, Type>> call(Params params);
}

@immutable
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
