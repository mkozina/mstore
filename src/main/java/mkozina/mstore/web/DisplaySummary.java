package mkozina.mstore.web;

import mkozina.mstore.storage.DataBase;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

/* przy pisaniu czesci kodu zwiazanego z mapami, korzystalem z:
 * http://beginnersbook.com/2013/12/treemap-in-java-with-example/
 * */

@WebServlet(urlPatterns = "/summary")
public class DisplaySummary extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//pobieramy contextPatha, aby prawidlowo osadzic arkusze stylow CSS w generowanym kodzie HTML
		ServletContext servletContext = getServletContext();
		String contextPath = servletContext.getContextPath();
		
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		out.println("<html>" +
		"<head>" +
		"<title>Summary of your DB</title>" +
		"<link href=\"" + contextPath + "/resources/main.css\" rel=\"stylesheet\">" +
		"</head>" +
		"<body>" +
		"<p>This is summary of your DB:</p>"
		);
		
		DataBase db = new DataBase();
		// pobranie beana
		db = (DataBase)servletContext.getAttribute("database");
		// uzycie mapy w celu zrobienia krotkiego podsumowania
		TreeMap<String, Integer> map = new TreeMap<String, Integer>();
		
		// utworzenie mapy
		// mapa sklada sie na artyste(klucz), i liczbe(wartosc) jego plyt na liscie
		// iterujemy po plytach na liscie
		for(int i = 0; i<db.getSize(); i++) {
			if(map.get(db.getCompactDisc(i).getArtist()) == null) {
				map.put(db.getCompactDisc(i).getArtist(), 1);
			} else {
				map.put(db.getCompactDisc(i).getArtist(), (map.get(db.getCompactDisc(i).getArtist()))+1 );
			}
		}
		
		// wypisanie podsumowania
		Set set = map.entrySet();
	      Iterator iterator = set.iterator();
	      while(iterator.hasNext()) {
	         Map.Entry<String, Integer> entr = (Map.Entry<String, Integer>)iterator.next();
	         out.println("<p>" + entr.getKey() + ": " + entr.getValue());
	         if(entr.getValue() == 1) out.println("CD</p>");
	         else out.println("CD's</p>");
	      }
		
		out.println("<p>Generated: " + new java.util.Date() + "</p>" +
		"<p><a href=\"showAllCompactDiscs.jsp\">Take a look at your DB</a></p>" +
		"<p><a href=\"getCompactDiscDataToSearch.jsp\">Search DB for specific item's</a></p>" +
		"<p><a href=\"index.jsp\">Back to Main Page</a></p>" +
		"</body>" +
		"</html>");
		
		out.close();
		
	}
	
}