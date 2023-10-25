trigger UpdateDescripton on Account (after update) {

    set<id> AccId = new set<id>();
    string description;
    List<contact> ccList = new List<contact>();
    
    if(trigger.isUpdate){
        
        for(Account cc : trigger.new){
            if(cc.Description != trigger.oldmap.get(cc.Id).Description){
                AccId.add(cc.Id);
                description = cc.Description;
            }
             
        }
        for(Contact c : [select id,name, AccountId  from contact where AccountId IN: AccId]){
            Contact con = new Contact();
            con.Description = description;
            con.Id = c.Id;
            
            ccList.add(con);
            
        }
        update ccList;
    }
}