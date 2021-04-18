import 'package:dartz/dartz.dart';
import 'package:flutter_portfolio/core/errors/errors.dart';
import 'package:flutter_portfolio/feature/clean_architecture/domain/entities/entities.dart';

abstract class ISpaceMediaRepository {
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate();
}
