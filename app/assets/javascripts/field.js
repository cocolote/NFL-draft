$('.position').on('click', function(e) {
  e.preventDefault();

  var posId = $(this).data('id');

  var getPlayers = $.get('/positions/'+posId);

  getPlayers.done(function(result) {
    var playersHTML = playersListHTML(result.players);
    debugger;

    $('#players-list-container').empty();
    $('#players-list-container').append(playersHTML.join(''));
  });
});

function playersListHTML(players) {
  listHTML = [];

  for (var i=0; i < players.length; i++) {
    var deact = '';
    var icon = 'fi-plus';
    debugger;
    if (players[i].team_id) {
      deact = 'deactivated';
      icon = 'fi-x';
    }

    listHTML.push('<a href="#">');
    listHTML.push('<div class="player-container row '+deact+'" id="pcont-'+players[i].id+'" data-player-id="'+players[i].id+'">');
    listHTML.push('<h3 id="player-'+players[i].id+'" class="'+icon+' small-1 column"></h3>');
    listHTML.push('<h3 class="player-name small-11 columns">'+players[i].name+'</h3></div></a>');
  }

  return listHTML;
}
