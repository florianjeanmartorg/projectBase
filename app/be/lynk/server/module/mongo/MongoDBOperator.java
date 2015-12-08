package be.lynk.server.module.mongo;

import be.lynk.server.dto.technical.DTO;
import com.mongodb.*;
import org.mongojack.JacksonDBCollection;
import org.springframework.stereotype.Component;
import play.Configuration;
import play.Logger;
import play.Play;
import play.libs.F;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by florian on 19/07/15.
 */
@Component
public class MongoDBOperator {


    private static String SERVER     = Configuration.root().getString("mongodb.servers");
    private static String CREDENTIAL = Configuration.root().getString("mongodb.credentials");
    private static String DATABASE   = Configuration.root().getString("mongodb.database");

    private static DB db = null;


//    mongodb.database=${MongodbDatabase}
//    mongodb.credentials=${MongodbCredential}
//    mongodb.servers=${MongodbServer}


    public DB getDB() {
        if (db == null) {
            initialization();
        }
        return db;
    }


    private void initialization() {
        try {

            List<MongoCredential> mongoCredential = new ArrayList<>();

            String user = CREDENTIAL.split(":")[0];
            String password = CREDENTIAL.split(":")[1];
            String dbName = DATABASE;
            String host = SERVER.split(":")[0];
            String port = SERVER.split(":")[1];
            MongoClient mongoClient;

            if (Play.isProd()) {

                String uriS = "mongodb://" + user + ":" + password + "@" + host + ":" + port + "/" + dbName;

                Logger.info("--------------------------------=>" + uriS);

                MongoClientURI uri = new MongoClientURI(uriS);

                mongoClient = new MongoClient(uri);
            }
            else{
                ServerAddress serverAddress = new ServerAddress(SERVER.split(":")[0], Integer.parseInt(SERVER.split(":")[1]));

                mongoClient = new MongoClient(serverAddress, mongoCredential);
            }

            db = mongoClient.getDB(dbName);


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public <T extends DTO> void write(String route, T dto, Class<T> clazz) {
        F.Promise.promise(() -> {

            if (db == null) {
                initialization();
            }

            try {

                DBCollection coll = db.getCollection(route);//name1+"."+name);

                JacksonDBCollection<T, String> jColl = JacksonDBCollection.wrap(coll, clazz,
                                                                                String.class);


                jColl.insert(dto);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null;
        });
    }
}
