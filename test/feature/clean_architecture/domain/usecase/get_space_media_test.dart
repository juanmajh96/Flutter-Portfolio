import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_portfolio/core/usecase/usecase.dart';
import 'package:flutter_portfolio/feature/clean_architecture/domain/entities/entities.dart';
import 'package:flutter_portfolio/feature/clean_architecture/domain/repositories/repositories.dart';
import 'package:flutter_portfolio/feature/clean_architecture/domain/usecase/usecase.dart';

class ISpaceMediaRepositoryMock extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceMediaUseCase _usecase;
  late ISpaceMediaRepositoryMock _repository;
  late SpaceMediaEntity _tSpaceMedia;
  late NoParams _noParams;

  setUp(() {
    _noParams = NoParams();
    _tSpaceMedia = SpaceMediaEntity(
      descripcion: 'descripcion',
      mediaType: 'mediaType',
      title: 'title',
      mediaUrl: 'mediaUrl',
    );
    _repository = ISpaceMediaRepositoryMock();
    _usecase = GetSpaceMediaUseCase(_repository);
  });

  test('It should get space media for given date from the repository',
      () async {
    when(
      () => _repository.getSpaceMediaFromDate(),
    ).thenAnswer(
      (_) async => Right(_tSpaceMedia),
    );

    final _result = await _usecase(_noParams);
    expect(_result, Right(_tSpaceMedia));
    verify(() => _repository.getSpaceMediaFromDate()).called(1);
  });


}
