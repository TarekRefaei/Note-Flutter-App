import 'package:equatable/equatable.dart';

class LocalOrOnline extends Equatable {
  final bool localOrOnline;

  const LocalOrOnline({
    this.localOrOnline = true,
  });


  LocalOrOnline copyWith({
    bool? localOrOnline,
  }) {
    return LocalOrOnline(
      localOrOnline: localOrOnline ?? this.localOrOnline,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'localOrOnline': localOrOnline,
    };
  }

  @override
  List<Object?> get props => [localOrOnline];
}