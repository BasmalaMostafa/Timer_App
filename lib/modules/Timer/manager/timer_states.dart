import 'package:equatable/equatable.dart';

abstract class TimerStates extends Equatable{
  final int duration;

  const TimerStates(this.duration);

  @override
  List<Object?> get props => [duration];
}

class TimerInitialState extends TimerStates{
  const TimerInitialState(super.duration);
}

class TimerRunningState extends TimerStates{
  const TimerRunningState(super.duration);
}

class TimerPausedState extends TimerStates{
  const TimerPausedState(super.duration);
}

class TimerFinishedState extends TimerStates{
  const TimerFinishedState() : super(0);
}