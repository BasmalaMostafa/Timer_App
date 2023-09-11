
class Ticker{
  Stream<int> tick({required int ticks}) => Stream.periodic(const Duration(seconds: 1),
          (index){
    return ticks - index -1;
          }).take(ticks);
}