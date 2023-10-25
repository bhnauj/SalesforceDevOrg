public class createContactFromAccountApexController {
    public Contact con{get;set;}
    public String actId;
    
    public createContactFromAccountApexController(ApexPages.StandardController controller){
        con = new Contact();
        actId = ApexPages.currentPage().getParameters().get('Id');
    }
    
    public Pagereference saveMethod() {
        con.AccountId = actId;
        insert con;
        PageReference parentPage = new PageReference('/' + con.Id);
        parentPage.setRedirect(true);
        return parentPage;
            }
}