package mkozina.mstore.data;

public class CompactDisc {
	
	private String artist = "unknown";
	private String album = "untitled";
	private int year = 1900;
	private int tracks = 99;

	public CompactDisc(String artist, String album, int year, int tracks) {
		this.artist = artist;
		this.album = album;
		this.year = year;
		this.tracks = tracks;
	}
	
	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}
	
	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
		}
	
	public int getTracks() {
		return tracks;
	}

	public void settracks(int tracks) {
		this.tracks = tracks;
		}
	
}