part of console;

/// A timer display that mimics pub's timer.
class TimeDisplay {
  Stopwatch _watch;
  bool _isStart = true;
  String _lastMsg;
  Timer _updateTimer;
  
  TimeDisplay();
  
  /// Starts the Timer
  void start([int place = 1]) {
    stdin.echoMode = false;
    _watch = new Stopwatch();
    _updateTimer = new Timer.periodic(new Duration(milliseconds: 50), (timer) {
      update(place);
    });
    _watch.start();
  }
  
  /// Stops the Timer
  void stop() {
    _watch.stop();
    stdin.echoMode = true;
    _updateTimer.cancel();
  }
  
  /// Updates the Timer
  void update([int place = 1]) {
    if (_isStart) {
      var msg = "(${_watch.elapsed.inSeconds}s)";
      _lastMsg = msg;
      Console.write(msg);
      _isStart = false;
    } else {
      Console.moveCursorBack(_lastMsg.length);
      var msg = "(${(_watch.elapsed.inMilliseconds / 1000).toStringAsFixed(place)}s)";
      _lastMsg = msg;
      Console.setBold(true);
      Console.write(msg);
      Console.setBold(false);
    }
  }
}
