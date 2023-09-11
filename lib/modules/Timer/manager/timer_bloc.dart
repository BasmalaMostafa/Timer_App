import 'package:bloc/bloc.dart';
import 'package:timer_app/modules/Timer/manager/timer_events.dart';
import 'package:timer_app/modules/Timer/manager/timer_states.dart';

import '../../../core/Ticker/ticker.dart';

class TimerBloc extends Bloc<TimerEvents,TimerStates>{
  final int duration=60;
  final Ticker ticker;
  late final tickerSubscription;


  TimerBloc({required this.ticker}):super(const TimerInitialState(60)){
    on<Start>((event,emit){
      emit(TimerRunningState(event.duration));
      tickerSubscription?.cancel();
      tickerSubscription= ticker.tick(ticks: event.duration).listen((myDuration) { 
        add(Tick(duration: myDuration));
      });
    });
    on<Pause>((event,emit){
      if(state is TimerRunningState){
        tickerSubscription.pause();
        emit(TimerPausedState(state.duration));
      }

    });
    on<Resume>((event,emit){
      if (state is TimerPausedState){
        tickerSubscription?.resume();
        emit(TimerRunningState(state.duration));
      }
    });
    on<Reset>((event,emit){
      tickerSubscription?.cancel();
      emit(TimerInitialState(duration));
    });
    on<Tick>((event,emit){
      if(event.duration >0){
        emit(TimerRunningState(event.duration));
      }else if(event.duration == 0){
        emit(const TimerFinishedState());
      }
    });

    @override
    Future<void> close(){
      tickerSubscription?.cancel();
      return super.close();
    };
  }




}