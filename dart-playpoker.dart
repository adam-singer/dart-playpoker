#import('dart:html');
#import('dart:math');

#source('UI.dart');
#source('PokerEngine.dart');
#source('Hand.dart');
#source('Card.dart');

var version = '';
var developmentStatus = 'lolol It actually does nothing but determining some hand values (see #Roadmap for details)';

bool debug = true;

void main() {


  initialize();

  newHand();
  //unitTestNewHand();
}