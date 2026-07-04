// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'fruit_hunt_event.dart';
// import 'fruit_hunt_state.dart';

// class FruitHuntBloc extends Bloc<FruitHuntEvent, FruitHuntState> {
//   FruitHuntBloc() : super(FruitHuntInitial()) {
//     on<StartHuntEvent>((event, emit) {
//       emit(FruitHuntLoaded());
//     });
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../domain/usecases/detect_item_usecase.dart';
import 'fruit_hunt_event.dart';
import 'fruit_hunt_state.dart';

class FruitHuntBloc extends Bloc<FruitHuntEvent, FruitHuntState> {
  final DetectItemUseCase detectItemUseCase;

  int _score = 0;

  FruitHuntBloc({
    required this.detectItemUseCase,
  }) : super(FruitHuntInitial()) {
    on<DetectFruitEvent>(_onDetectFruit);
    on<ResetFruitHuntEvent>(_onResetGame);
  }

  Future<void> _onDetectFruit(
    DetectFruitEvent event,
    Emitter<FruitHuntState> emit,
  ) async {
    emit(FruitHuntLoading());

    try {
      final detectedItem = await detectItemUseCase(event.imageFile);

      if (detectedItem.isFruit) {
        _score++;

        if (_score >= 5) {
          emit(FruitHuntCompleted(score: _score));
        } else {
          emit(
            FruitHuntLoaded(
              score: _score,
              detectedItem: detectedItem,
              message: AppStrings.foodDetected,
            ),
          );
        }
      } else {
        emit(
          FruitHuntLoaded(
            score: _score,
            detectedItem: detectedItem,
            message: AppStrings.noFoodDetected,
          ),
        );
      }
    } catch (e) {
      emit(
        FruitHuntError(
          message: e.toString(),
        ),
      );
    }
  }

  void _onResetGame(
    ResetFruitHuntEvent event,
    Emitter<FruitHuntState> emit,
  ) {
    _score = 0;
    emit(FruitHuntInitial());
  }
}