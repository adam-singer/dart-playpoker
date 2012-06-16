#import('dart:html');

#source('Deck.dart');
#source('Hand.dart');
#source('Card.dart');

var version = 'N/A';
var developmentStatus = 'development just started, not working at all!';



void main() {
  initialize();



}

void initialize(){
  fdb('Initializing...');
  document.query('#status').innerHTML = '<b>Version:</b> $version &nbsp;&nbsp;||&nbsp;&nbsp; <b>Stage: </b> $developmentStatus';
  
  
  
  for (var i = 1; i < 6; i++) {
    document.query('#c$i').src = 'img/deck.png';
    document.query('#h$i').src = 'img/deck.png';
  }
  
  //Computer  player 0;
  //Human     player 1;
  
  updateStatus(0,"Idle");  
  updateStatus(1,"Idle"); 
  
  fdb('initializing deck class');
  Deck mainDeck = new Deck();
  
  
  //write n. of cards in mainDeck
//  document.query('#remainingCards').innerHTML=mainDeck.remainingCards().toString();
  
  
  //Serving hand to players
  serveHand(1);
  
}



void updateStatus(int player, String status){
  fdb('setting player $player status to $status');
  String divStatus;

  switch(player){
    case 0:
      divStatus = '#computerStatus';
      break;
    case 1:
      divStatus = '#humanStatus';
      break;
    
  }
  document.query('$divStatus').innerHTML='Status: $status';
  
}


void serveHand(int player){
  
}

void fdb(String debugMsg){
  // short for 'feed debug buffer'
  Date theTime = new Date.now();
  var debugBuffer=document.query('#debug').innerHTML;
  document.query('#debug').innerHTML='$debugBuffer$theTime $debugMsg<br/>';
  document.query('#debug').scrollByLines(9999999);
}