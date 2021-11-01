package connect_four;

public class Player {
	String playerName;
	int noOfMove;
	public String getPlayerName() {
		return playerName;
	}
	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	public int getNoOfMove() {
		return noOfMove;
	}
	public void setNoOfMove(int noOfMove) {
		this.noOfMove = noOfMove;
	}
	@Override
	public String toString() {
		return "Player [playerName=" + playerName + ", noOfMove=" + noOfMove + "]";
	}
	
}
