#import('dart:html');

#source('UI.dart');
#source('PokerEngine.dart');
#source('Hand.dart');
#source('Card.dart');

var version = 'N/A';
var developmentStatus = 'development just started, it does nothing but determining some hand values.';
final bool debug = true;

void main() {
  initialize();
}