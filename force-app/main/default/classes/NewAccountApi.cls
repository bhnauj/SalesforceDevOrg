@RestResource(urlMapping='/newAccount/*')
global with sharing class NewAccountApi {
	
    @HttpPost
    global static ModelClass doAccountPost(){
        RestRequest req = RestContext.request;
            NewAccount logoutCls = (NewAccount)JSON.deserialize(req.requestBody.toString(),NewAccount.class);
            
        	Account acc =  new Account();
        	acc.Name = logoutCls.First_Name + logoutCls.Last_Name;
        	acc.Phone = logoutCls.phone;
        	insert acc;
        
        	ModelClass mcls = new ModelClass();
        	mcls.Status = 'OK';
        	mcls.Message = 'Account accidently successfully registered';
        	mcls.AccountId = acc.Id;
        
        return mcls;
        
    }


public class NewAccount{
  
    public string First_Name;
    public string Last_Name; 
    public string phone; 	    
}

global class ModelClass {
        public String Status 	{get;set;}
        public String Message 	{get;set;}
    	public string AccountId {get;set;}
        public ModelClass() {
            Status = '';
            Message = '';
            AccountId ='';
        }
    }
    
public static ModelClass checkValidation(String Status,String Message) {
        ModelClass modCls = new ModelClass();
        modCls.Status = Status;
        modCls.Message = Message;
        return modCls;
    }    
}