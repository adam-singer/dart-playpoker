void initialize(){
  fdb('Initializing...');
  document.query('#status').innerHTML = '<b>Version:</b> $version || <b>Stage: </b> $developmentStatus || <b>Debug (verbosity): </b>$debug';

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


void fdb(String debugMsg){
  // short for 'feed debug buffer'
  if(debug){
  Date theTime = new Date.now();
  var debugBuffer=document.query('#debug').innerHTML;
  document.query('#debug').innerHTML='$debugBuffer$theTime $debugMsg<br/>';
  document.query('#debug').scrollByLines(9999999);
  }
}