//abstruct class to represent an event incase more events are to be added in future
abstract class Event {}

//class to represent the event that will fetch the data from the API
class RetrieveDataEvent extends Event {}