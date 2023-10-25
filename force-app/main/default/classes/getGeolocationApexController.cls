public class getGeolocationApexController {
    public String address{ get; set; } 
    public decimal latt { get; set; }       
    public decimal longt { get; set; }
    public Account acct{get;set;}
    List<Account> acctList;
    String usrId;
    String actId;
    
    public getGeolocationApexController(ApexPages.StandardController controller){
         address='';
        acct = new Account();
        actId = ApexPages.currentPage().getParameters().get('id');
        latt=acct.Visit_Location__Latitude__s;
        longt=acct.Visit_Location__Longitude__s;
    }
}