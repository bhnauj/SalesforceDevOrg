@RestResource(urlMapping='/loginWithMobileService/*')
global class loginWithMobileService{
    @HttpPost
    global static String doPost() {
        String rep;
        Savepoint sp = Database.setSavepoint();
        try{
            RestRequest req = RestContext.request;        
            loginDetail login = (loginDetail)Json.deserialize(req.requestBody.tostring(),loginDetail.class);
          list<account> aclist=[ select id, name ,(select Account__c ,Logged_In__c,Login_Time__c,Logout_Time__c,Token__c from LoginSession__r) from Account where phone= :login.phone];
          if(aclist.size()>0){
              Account ac = aclist[0];
              Login_Session__c logSession= new Login_Session__c();
              String salt = String.valueOf(Crypto.getRandomInteger());
                String key = string.valueOf(login.phone)+string.valueOf(system.now());
                Blob data = crypto.generateMac('HmacSHA256',Blob.valueOf(salt), Blob.valueOf(key));
                string token= EncodingUtil.convertToHex(data).toUpperCase();
              if(ac.LoginSession__r.size()>0){
                  logSession =ac.LoginSession__r[0];
                  logSession.Login_Time__c = system.now();
                  logSession.Session_Time__c = (system.now()).addMinutes(30);
                  logSession.Logged_In__c = True;
                  logSession.Account__c =ac.id;
                  logSession.Last_Hit_Time__c=system.now();
                  logSession.Token__c=token;
                  update logSession;
                  
                  }
                  else{
                  logSession = new Login_Session__c();
                  logSession.Login_Time__c = system.now();
                  logSession.Session_Time__c = (system.now()).addMinutes(30);      
                  logSession.Logged_In__c = True;
                  logSession.Account__c = aclist[0].id;
                  logSession.Last_Hit_Time__c=system.now();
                  logSession.Token__c=token;
                  insert logSession;                  
                  }
                  Session_History__c sessionHtry = new Session_History__c();
                  sessionHtry.Login_Session__c = logSession.id;
                  sessionHtry.Login_Time__c = system.now();
                  sessionHtry.Session_Time__c = system.now();
                  insert sessionHtry;

                  rep='session Initiated with token '+token;
          }
          else{
            rep='Invalid Mobile';
                  return rep;
          }
          
        }catch(exception e){
            rep = e.getMessage();
            Database.rollback(sp);
        }
        return rep;
    }
     
    public class loginDetail{
        public String phone{get; set; }        
    }
}