import 'package:flutter_portfolio/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_portfolio/core/usecase/usecase.dart';
import 'package:flutter_portfolio/feature/clean_architecture/domain/entities/entities.dart';
import 'package:flutter_portfolio/feature/clean_architecture/domain/repositories/repositories.dart';

class GetSpaceMediaUseCase implements UseCase<SpaceMediaEntity, NoParams> {
  GetSpaceMediaUseCase(this._repository);
  final ISpaceMediaRepository _repository;

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(NoParams params) async {
    return await _repository.getSpaceMediaFromDate();
  }
}
