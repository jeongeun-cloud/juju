package message;

import java.io.IOException;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;

@Service
public class messageService {

	

	/*
	 * private FirebaseApp firebaseBuilder(Map<String, Object> auth) throws
	 * IOException { FirebaseOptions options = new FirebaseOptions.Builder()
	 * .setCredentials(GoogleCredentials.getApplicationDefault())
	 * .setDatabaseUrl("https://.firebaseio.com/")
	 * .setDatabaseAuthVariableOverride(auth) .build(); if
	 * (FirebaseApp.getApps().isEmpty()) return FirebaseApp.initializeApp(options);
	 * else return FirebaseApp.getInstance(); }
	 * 
	 * public void sendAlarm() {
	 * 
	 * try { FirebaseMessaging messaging =
	 * FirebaseMessaging.getInstance(firebaseBuilder());
	 * 
	 * Message message = Message.builder().setToken(
	 * "eOcXdRt0UzNbFWNanuDDwz:APA91bHlW0EKSj856lc5g795DG4_wA6JPZyDZS0fC5LdjDzYot2yz1DcqPTniIIPBka-mPSQ89TKQBAFMbgGb-TYFqzku24yhtt66MXUEQLwzFN50E7HkYutei0GMVUT5QzHaLcSmE0h")
	 * .setNotification(new Notification("juju", "안녕하세요 juju테스트입니다.")).build();
	 * 
	 * messaging.send(message);
	 * 
	 * } catch (IOException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } catch (FirebaseMessagingException fe) { // TODO
	 * Auto-generated catch block fe.printStackTrace(); } }
	 */

	}


