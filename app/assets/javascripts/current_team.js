var turns = $('.team-avatar-container');
var turnId = turns[0].id;
var teamId = $('#'+turnId).data('team-id');

$('#'+turnId).addClass('current');

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
    $('#'+turnId).addClass('current');
  });
  updateTurn.fail(function(result) {
    alert(result.responseJSON.message);
  });
});
