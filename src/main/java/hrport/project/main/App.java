package hrport.project.main;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.time.LocalDate;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import hrport.project.main.adaptergson.LocalDateAdapter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.*;
import hrport.project.main.service.UtenteService;
import jakarta.servlet.http.HttpServletResponse;

public class App {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		Set<EspLavorativa> esp = new HashSet<>();
		Set<Istruzione> ist = new HashSet<>();
		
		//ProfiloUtente profiloUtente = new ProfiloUtente(2, "test", "test", null, "test", "test", true, LocalDate.of(2023, 11, 19), "test", "test", "123", "test", "test", "test", esp, ist);
		
		// TODO Auto-generated method stub
		/*System.out.println("HelloWorld");
		 * 
		 *
		 
		
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
//			String jsonString = "{ \"quiz_id\": 1, \"user_id\": 2, \"answers\": [ { \"question_id\": 1, \"selected_option_id\": 3 }, { \"question_id\": 2, \"selected_option_id\": 1 }, { \"question_id\": 3, \"selected_option_id\": 2 }, { \"question_id\": 4, \"selected_option_id\": 4 } ] }";
//			JsonObject json = (JsonObject) JsonParser.parseString(jsonString);
//			int quizId = json.get("quiz_id").getAsInt();
//			int idUtente= json.get("user_id").getAsInt();
//
//		    JsonArray answersArray = json.getAsJsonArray("answers");
//		    List<JsonObject> answersList = new ArrayList<>();
//		    answersArray.forEach(answer -> answersList.add(answer.getAsJsonObject()));
//
//		    Collections.sort(answersList, Comparator.comparingInt(o -> o.get("question_id").getAsInt()));
//
//		    int[] selectedOptionIds = new int[answersList.size()];
//		    for (int i = 0; i < answersList.size(); i++) {
//		        selectedOptionIds[i] = answersList.get(i).get("selected_option_id").getAsInt();
//		    }
//			
//			Quiz.insertRisposteDate(idUtente, quizId, selectedOptionIds);
//			
//			String error = "{\"data\" : \"success\"}";
        	
        	Utente utente = UtenteService.getUserByIdUtenteWithPositions(1);
        	
        	Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
        	String json = gson.toJson(utente);
        	System.out.println(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
