
abstract class HomeEvents{
  const HomeEvents();
}

class TriggerHomeEvent extends HomeEvents{
  final int index;
  const TriggerHomeEvent(this.index):super();

}