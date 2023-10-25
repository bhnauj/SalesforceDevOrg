public class NewAndExistingController {

 

    public opportunity opp { get;set; }

 

   public NewAndExistingController() {

    }

public Pagereference SaveMethod()
{
    Insert opp;
    PageReference redirectSuccess = new Pagereference('/' +opp.Id);

        return (redirectSuccess);

}
 

   }