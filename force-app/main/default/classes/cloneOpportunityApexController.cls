public class cloneOpportunityApexController {
    public Opportunity opp{get;set;}
    public List<Opportunity> oppList;
    public String parentopp;
    
    public cloneOpportunityApexController(ApexPages.StandardController controller){
        
        parentopp = ApexPages.currentPage().getParameters().get('Id');
        oppList = [SELECT id,name,Amount,Account_type__c,AccountId,CloseDate,StageName 
                   FROM Opportunity
                   WHERE id=:parentOpp];
    }
    
    public PageReference cloneOpp(){
        opp = new Opportunity();
        for( Opportunity oppt:oppList){
            opp.AccountId = oppt.AccountId;
            opp.Account_type__c = oppt.Account_type__c;
            opp.Amount = oppt.Amount;
            opp.Name = oppt.Name;
            opp.StageName = oppt.StageName;
            opp.CloseDate = oppt.CloseDate;
            opp.Parent_Opportunity__c = oppt.id;
        }
        insert opp;
        PageReference parentPage = new PageReference('/' + opp.Id);
        parentPage.setRedirect(true);
        return parentPage;
    } 
    
    
}