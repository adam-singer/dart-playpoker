#import('dart:html');

#source('Deck.dart');
#source('Hand.dart');
#source('Card.dart');

var version = '-';
var developmentStatus = 'development just started, not working at all!';



void main() {
  initialize();
}

void initialize(){
  document.query('#version').innerHTML = '<b>Version:</b> $version';
  document.query('#developmentStatus').innerHTML= '<b>Stage:</b> $developmentStatus';
  
  for (var i = 1; i < 6; i++) {
    document.query('#c$i').src = 'img/deck.png';
    document.query('#h$i').src = 'img/deck.png';

  }
  
  //Computer  player 0;
  //Human     player 1;
  
  updateStatus(0,"Idle");  
  updateStatus(1,"Idle");  
}



void updateStatus(int player, String status){
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
