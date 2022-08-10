class PlayerMove {
  final String playerId;
  final int positionPlayed;

  /// Model for a player's move.
  /// Positon played is determined by a number between 0 and 8.
  /// 0 represents the top left corner, 1 represents the top middle, etc.
  /// PlayerId is the id of the player who made the move. id is from Firebase
  PlayerMove({required this.playerId, required this.positionPlayed});
}
