package message;

//import java.io.FileInputStream;
//import java.io.IOException;
//import java.util.Map;
//
//import org.springframework.stereotype.Service;
//
//import com.google.auth.oauth2.GoogleCredentials;
//import com.google.firebase.FirebaseApp;
//import com.google.firebase.FirebaseOptions;
//import com.google.firebase.messaging.FirebaseMessaging;
//import com.google.firebase.messaging.FirebaseMessagingException;
//import com.google.firebase.messaging.Message;
//import com.google.firebase.messaging.Notification;

//@Service
//public class messageService {
////fromStream(new FileInputStream("C:\\juju\\jujumarket-a49084e43521.json")
//	private FirebaseApp firebaseBuilder() throws IOException{
//		FirebaseOptions options = new FirebaseOptions.Builder()
//				.setCredentials(GoogleCredentials.fromStream(new FileInputStream("C:\\juju\\jujumarket-a49084e43521.json")))
//				.setDatabaseUrl("https://jujumarket-23.firebaseio.com/")
//				.build();
//		if (FirebaseApp.getApps().isEmpty())
//			return FirebaseApp.initializeApp(options);
//		else
//			return FirebaseApp.getInstance();
//	}
//
//	public void sendAlarm() {
//
//		try {
//			FirebaseMessaging messaging = FirebaseMessaging.getInstance(firebaseBuilder());
//
//			Message message = Message.builder().setToken("eOcXdRt0UzNbFWNanuDDwz:APA91bHlW0EKSj856lc5g795DG4_wA6JPZyDZS0fC5LdjDzYot2yz1DcqPTniIIPBka-mPSQ89TKQBAFMbgGb-TYFqzku24yhtt66MXUEQLwzFN50E7HkYutei0GMVUT5QzHaLcSmE0h")
//
//
//					.setNotification(new Notification("jujumarket", "안녕하세요 테스트입니다.")).build();
//
//
//			messaging.send(message);
//
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (FirebaseMessagingException fe) {
//			// TODO Auto-generated catch block
//			fe.printStackTrace();
//		}
//	}
//
//}