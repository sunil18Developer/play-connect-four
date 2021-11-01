package connect_four;

public class Settings {
	int noOfRow;
	int noOfColumn;
	int noOfPiece;
	public int getNoOfRow() {
		return noOfRow;
	}
	public void setNoOfRow(int noOfRow) {
		this.noOfRow = noOfRow;
	}
	public int getNoOfColumn() {
		return noOfColumn;
	}
	public void setNoOfColumn(int noOfColumn) {
		this.noOfColumn = noOfColumn;
	}
	public int getNoOfPiece() {
		return noOfPiece;
	}
	public void setNoOfPiece(int noOfPiece) {
		this.noOfPiece = noOfPiece;
	}
	@Override
	public String toString() {
		return "Settings [noOfRow=" + noOfRow + ", noOfColumn=" + noOfColumn + ", noOfPiece=" + noOfPiece + "]";
	}
	
}
