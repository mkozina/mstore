package mkozina.mstore.storage;

import java.util.ArrayList;
import java.util.List;

import mkozina.mstore.data.CompactDisc;

public class DataBase {
	
	private List<CompactDisc> db = new ArrayList<CompactDisc>();
	
	public void add(CompactDisc compactDisc){
		CompactDisc newCompactDisc = new CompactDisc(compactDisc.getArtist(), compactDisc.getAlbum(), compactDisc.getYear(), compactDisc.getTracks());
		db.add(newCompactDisc);
	}
	
	public List<CompactDisc> getAllCompactDiscs(){
		return db;
	}
	
}