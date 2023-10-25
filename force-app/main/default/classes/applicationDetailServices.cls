@RestResource(urlMapping='/applicationDetailServices/*')
global class applicationDetailServices{
    @HttpPost
    global static String doPost() {
        String rep;
        Savepoint sp = Database.setSavepoint();
        try{
           RestRequest req = RestContext.request;        
           appDetail appD = (appDetail)Json.deserialize(req.requestBody.tostring(),appDetail.class);

            Login_Session__c ls = new Login_Session__c();
            List<Login_Session__c> lsList = new List<Login_Session__c>();
             lsList = [select id from Login_Session__c where Token__c=:appD.token AND Logged_In__c=True];
            
            if(lsList.size()>0){
                List<opportunity> opp = new List<opportunity>();
                opp = [select OrderNumber__c,Name from opportunity where OrderNumber__c=:appD.orderNo];
            	rep = JSON.serialize(opp);
            }
            else{
               rep = 'session End';
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