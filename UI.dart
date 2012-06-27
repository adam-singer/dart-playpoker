void initialize(){
  if(!debug){
    document.query('#debugBuffer').hidden=true;
  }
  fdb('Initializing...');
  document.query('#status').innerHTML = '<b>Stage: </b> $developmentStatus<br/><b>Debug (verbosity): </b>$debug<br/>Change <code>bool debug = true</code> to <code>bool debug = false</code> in <code>dart-playpoker.dart:11</code> or viceversa to show/hide custom debug messages and computer\'s cards';

  for (var i = 1; i < 6; i++) {
    document.query('#c$i').src = 'img/deck.png';
    document.query('#h$i').src = 'img/deck.png';
  }
  //Computer  player 0;
  //Human     player 1;
  updateStatus(0,"Idle");  
  updateStatus(1,"Idle"); 
  



  document.query('#sortBySuite').on.click.add((e) {
    fdb('Not implemented yet');
  });
  
  document.query('#newHandButton').on.click.add((e){
    newHand();
  });

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