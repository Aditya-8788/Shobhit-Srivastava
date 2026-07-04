// import '../repositories/fruit_hunt_repository.dart';

// class CheckFruitUseCase {
//   final FruitHuntRepository repository;

//   const CheckFruitUseCase(this.repository);

//   Future<bool> call(String label) async {
//     return repository.checkFruit(label);
//   }
// }
import '../repositories/fruit_hunt_repository.dart';

class CheckFruitUseCase {
  final FruitHuntRepository repository;

  CheckFruitUseCase(this.repository);

  bool call(
    String label,
  ) {
    return repository.checkFruit(
      label,
    );
  }
}