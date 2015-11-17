package mkozina.mstore.storage;

import java.util.ArrayList;
import java.util.List;

import mkozina.mstore.data.CompactDisc;

public class DataBase {
	
	private List<CompactDisc> db = new ArrayList<CompactDisc>();
	
	// dodawanie obiektu do listy
	public void add(CompactDisc compactDisc){
		CompactDisc newCompactDisc = new CompactDisc(compactDisc.getArtist(), compactDisc.getAlbum(), compactDisc.getYear(), compactDisc.getTracks());
		db.add(newCompactDisc);
	}
	
	// modyfikowanie istniejacego obiektu w liscie
	// pierwszy parametr wskazuje na indeks obiektu w liscie
	// drugi parametr to obiekt, z ktorego pobieramy nowe informacje
	public void modify(String index, CompactDisc compactDisc) {
		int indexInt = Integer.parseInt(index);
		db.set(indexInt, new CompactDisc(compactDisc.getArtist(), compactDisc.getAlbum(), compactDisc.getYear(), compactDisc.getTracks()));
	}
	
	// usuwanie istniejacego obiektu z listy
	// parametr wskazuje na indeks obiektu w liscie
	public void delete(String index) {
		int indexInt = Integer.parseInt(index);
		db.remove(indexInt);
	}
	
	// pobranie calej listy
	public List<CompactDisc> getAllCompactDiscs(){
		return db;
	}
	
	// pobranie pojedynczego obiektu
	// parametr wskazuje na indeks obiektu w liscie
	public CompactDisc getCompactDisc(int position){
		return db.get(position);
	}
	
	// pobranie rozmiaru listy
	public int getSize(){
		return db.size();
	}
	
}