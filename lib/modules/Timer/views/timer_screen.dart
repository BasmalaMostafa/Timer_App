import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/modules/Timer/manager/bloc.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer APP'),
      ),
      body: Stack(
        children: [
          WaveWidget(
            config: CustomConfig(
              gradients:[
                [
                  const Color.fromRGBO(72, 74, 126, 1),
                  const Color.fromRGBO(125, 170, 206, 1),
                  const Color.fromRGBO(184, 189, 245, 0.7)
                ],
                [
                  const Color.fromRGBO(72, 74, 126, 1),
                  const Color.fromRGBO(125, 170, 206, 1),
                  const Color.fromRGBO(172,182 , 219, 0.7)
                ],
                [
                  const Color.fromRGBO(72, 74, 126, 1),
                  const Color.fromRGBO(125, 170, 206, 1),
                  const Color.fromRGBO(190, 238, 246, 0.7)
                ],
              ],
              durations: [19440,10000,6000],
              gradientBegin : Alignment.bottomCenter,
              gradientEnd : Alignment.topCenter,
              heightPercentages:  [0.03,0.01,0.02] ,
            ),
            size: const Size(double.infinity, double.infinity),
            backgroundColor : Colors.blue[50]
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: Center(
                  child: BlocBuilder<TimerBloc,TimerStates>(
                    builder: (BuildContext context, state) {
                      final String minSection = ((state.duration /60)% 60).floor().toString().padLeft(2);
                      final String secSection = (state.duration % 60).floor().toString().padLeft(2);
                      return Text('$minSection:$secSection',
                        style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color: Colors.white),);
                    },
                  ),
                ),
              ),
              BlocBuilder<TimerBloc,TimerStates>(
                condition:(preState,currentState) =>currentState.runtimeType !=preState.runtimeType,
                builder: (BuildContext context, state) {
                  return Actions(actions: {}, child: null,);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
