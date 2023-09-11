import 'package:equatable/equatable.dart';

class TimerEvents extends Equatable{
  const TimerEvents();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Start extends TimerEvents{
  final int duration;

  const Start({required this.duration});

  @override
  String toString() {
    // TODO: implement toString
    return "Start at (duration : $duration)";
  }
}

class Pause extends TimerEvents{}

class Resume extends TimerEvents{}

class Reset extends TimerEvents{}

class Tick extends TimerEvents{
  final int duration;

  const Tick({required this.duration});

  @override
  // TODO: implement props
  List<Object?> get props => [duration];

  @override
  String toString() {
    // TODO: implement toString
    return "Tick at (duration : $duration)";
  }
}
