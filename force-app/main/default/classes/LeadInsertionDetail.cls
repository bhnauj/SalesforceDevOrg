@RestResource(urlMapping='/LeadInsertionDetail/*')
    global class LeadInsertionDetail{
        @HttpPost
        global static String doPost() {
            String rep;
            Savepoint sp = Database.setSavepoint();
            try{
               RestRequest req = RestContext.request;        
              leadDetail leadD = (leadDetail)Json.deserialize(req.requestBody.tostring(),leadDetail.class);
    
                
                Login_Session__c ls = new Login_Session__c();
                List<Login_Session__c> lsList = new List<Login_Session__c>();
                 lsList = [select id from Login_Session__c where Token__c=:leadD.token AND Logged_In__c=True];
                
                if(lsList.size()>0){
                    Lead ld = new Lead();
                    ld.Status = leadD.status;
                    ld.LastName = leadD.lastName;
                    ld.Company = leadD.company;
                    insert ld;
                    rep = 'Lead Inserted';
                  //  List<opportunity> opp = new List<opportunity>();
                  //  opp = [select OrderNumber__c,Name from opportunity where OrderNumber__c=:leadD.orderNo];
                  //  rep = JSON.serialize(opp);
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
        public class leadDetail{
            public string token    {get; set;}
            public string orderNo  {get; set;}
            public string status   {get; set;}
            public string lastName {get; set;}
            public string company  {get; set;}
        }
    }