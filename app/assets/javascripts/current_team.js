var turns = $('.team-avatar-container');
var turnId = turns[0].id;
var teamId = $('#'+turnId).data('team-id');
var round = $('#'+turnId).data('round');
var turn = $('#'+turnId).data('turn');

$('#'+turnId).addClass('current');
$('#round').text(round);
$('#turn').text(turn);

$('#players-list-container').on('click', '.player-container', function(e) {
  e.preventDefault();
  var playerId = $(this).data('player-id');

  var updateTurn = $.ajax({
    url: '/turns/' + turnId,
    type: 'PUT',
    data: { team_id: teamId, player_id: playerId },
    dataType: 'json'
  });
  updateTurn.done(function(result) {
    $('#player-'+playerId).removeClass('fi-plus');
    $('#player-'+playerId).addClass('fi-x');
    $('#pcont-'+playerId).addClass('deactivated');

    $('#'+turns[0].id).slideUp('slow');

    turns.splice(0,1);

    turnId = turns[0].id;
    teamId = $('#'+turnId).data('team-id');
    round = $('#'+turnId).data('round');
    turn = $('#'+turnId).data('turn');

    $('#'+turnId).addClass('current');
    $('#round').text(round);
    $('#turn').text(turn);
    lastMove();
  });
  updateTurn.fail(function(result) {
    alert(result.responseJSON.message);
  });
});


function lastMove() {
  var lastMovesList = $('.player-team-container');

  $.get('/players', function(result) {
    $('#players-teams-list').empty();

    var lastMovesHTML = [];
    for (var i=0; i<result.length; i++) {
      lastMovesHTML.push('<li class="player-team-container row">');
      lastMovesHTML.push('<p class="last-added-players small-10 columns">'+result[i].name+'</p>');
      lastMovesHTML.push('<img src="/assets/'+result[i].team_logo+'" class="last-added-team small-2 columns">');
      lastMovesHTML.push('</li>');
    };

    $('#players-teams-list').append(lastMovesHTML.join(''));
  });
}
