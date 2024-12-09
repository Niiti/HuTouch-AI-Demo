import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/order_repository.dart';

class AddNoteUseCase {
  final OrderRepository repository;

  AddNoteUseCase(this.repository);

  Future<Either<Failure, String>> execute(String note) async {
    // Implement the use case logic, possibly adding note in repository
    // For simplicity, return Right with the note
    return Right(note);
  }
}
