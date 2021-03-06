import 'package:equatable/equatable.dart';

class SpaceMediaEntity extends Equatable {
  SpaceMediaEntity({
    required this.descripcion,
    required this.mediaType,
    required this.title,
    required this.mediaUrl,
  });
  final String descripcion;
  final String mediaType;
  final String title;
  final String mediaUrl;

  @override
  List<Object?> get props => [
        descripcion,
        mediaType,
        title,
        mediaUrl,
      ];
}
