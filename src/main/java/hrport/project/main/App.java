package hrport.project.main;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.time.LocalDate;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import hrport.project.main.adaptergson.LocalDateAdapter;
import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.*;
import hrport.project.main.service.UtenteService;

public class App {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*System.out.println("HelloWorld");
		
		try {
			Quiz q= Quiz.initQuiz(1);
			
			System.out.println("Nome: "+q.getNome()+
					"\nPunteggio domanda 1: "+q.domandaIndex(0).getPunteggio()+
					"\nTesto risposta n2: "+q.domandaIndex(0).rispostaIndex(1).getTesto());
			System.out.println(((Domanda)q.getDomande()[0]).getTesto());
			
			int[] array= {1,2,3,4};
			Quiz.risposteDate(2, 1, array);
			
			System.out.println(Quiz.getPunteggio(1, 1));
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
        try {
        	
        	Utente utente = UtenteService.getUserByIdUtenteWithProfile(1);
        	
        	Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
        	String json = gson.toJson(utente);
        	System.out.println(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
