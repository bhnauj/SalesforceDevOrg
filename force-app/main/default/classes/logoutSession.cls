@RestResource(urlMapping='/logoutSession/*')
global class logoutSession{
    @HttpPost
    global static String doPost() {
        String rep;
        Savepoint sp = Database.setSavepoint();
        try{
           RestRequest req = RestContext.request;        
           appDetail appD = (appDetail)Json.deserialize(req.requestBody.tostring(),appDetail.class);

            Login_Session__c ls = new Login_Session__c();
            List<Login_Session__c> lsList = new List<Login_Session__c>();
             lsList = [select id,Logout_Time__c,Logged_In__c from Login_Session__c where Token__c=:appD.token];
            
            if(lsList.size()>0 && lsList[0].Logged_In__c == True){
                Login_Session__c logsession = lsList[0];
                logsession.Token__c = '';
                logsession.Logged_In__c = false;
                logsession.Logout_Time__c = system.now();
                update logsession;
                
                rep = 'session Logout ';
            }
            else{
               rep = 'session Id Invalid';
            }
                   
    	}
        	catch(exception e){
            rep = e.getMessage();
            Database.rollback(sp);
            }
        return rep;
    }
    public class appDetail{
        public string token   {get; set;}
        public string orderNo {get; set;}
    }
}