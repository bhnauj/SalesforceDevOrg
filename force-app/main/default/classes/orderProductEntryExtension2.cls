/*

edited by : Saifullah Saifi 22/08/2017
*/
public with sharing class orderProductEntryExtension2 {

    

    public List<Order_Line_Item__c > orderList {get;set;}
    public List<Order_Line_Item__c > newOrderList {get;set;}
    public set<id> pid= new set<id>(); 
    public Product__c[] allProducts {get;set;}
    public Account accnt {get;set;}
    public Order_Line_Item__c[] shoppingCart {get;set;}
    public String toUnselect {get; set;}
    public string state {get;set;}
    private Order_Line_Item__c [] forDeletion = new Order_Line_Item__c []{};
    public string toselect{get;set;}
    public map<Id,Product__c> allproductsMap{get;set;}
    public id accid;
    public string ProdName{get; set;}
    public integer count;
    public order__c ord;
    
    public orderProductEntryExtension2() {
        orderList = new List<Order_Line_Item__c >();
        newOrderList = new List<Order_Line_Item__c >();
        allproductsMap = new map<Id,Product__c>(); 
        
        accid = ApexPages.currentPage().getParameters().get('accid');
        orderline(accid);
        allProducts = new List<Product__c>();
        allProducts = [Select Id,Name,Product_Name__c,Price__c,Product_Description__c,Unit_Price__c From Product__c];
        accnt = [Select id,Type,Name From Account WHERE Id =: accid LIMIT 1];
        system.debug('accnt-->'+accnt);
        for(Product__C pro:allProducts)
            allproductsMap.put(pro.id,pro);
          count=0;
        ord= new order__c();
    }
    
    public PageReference removeFromShoppingCart(){
        List<Order_Line_Item__c> oLst = [Select Id from Order_Line_Item__c where id=:toUnselect];
        delete oLst;
        orderline(accid);
        return null;
    }
    
    
    public pagereference addlineitem()
    {     
       List<order__c> ordList=[select id from order__c where Account_order__c=:accid];
      
      if(count==0){      
      ord.Name ='Order-'+accid;
      ord.Account_order__c=accid;
      ord.Order_Date__c= system.today();
      insert ord;
          system.debug('ord'+ord);
                       count++;      
      }

          Order_Line_Item__c ol = new Order_Line_Item__c();
        ol.Order__c=ord.id;
        ol.Quantity__c=1;
            ol.Product__c=toselect;
        Product__c temPro =  allproductsMap.get(toselect);
        system.debug(temPro.name);
        if(temPro != Null)
            //ol.Product__r.name = temPro.name;
       
        system.debug(ol.Product__r.name);
        newOrderList.add(ol);            
         insert ol;
         system.debug(orderList);
        orderline(accid);
         //orderList.add(ol);
        //PageReference pageRef = new PageReference('/apex/createorderpage');
        return null;

        
    }   
     public void orderline(string accid){
     
         orderlist =[select Id,Quantity__c,Product__c,Price__c,Order__c,Product__r.name,Product__r.Unit_Price__c from  Order_Line_Item__c where order__r.Account_order__c=:accid];
        
     
     }
      public PageReference cancel() {
         PageReference acctPage = new PageReference('/'+accid);
            acctPage.setRedirect(true);
        return acctPage; 
        
    }


    public PageReference save() {
         PageReference acctPage = new PageReference('/'+orderlist[0].Order__c);
            acctPage.setRedirect(true);
        return acctPage;
    }
    public PageReference search() {
        if(ProdName!=''){
            string search= '%'+ProdName+'%';
            allProducts =[Select Id,Name,Product_Name__c,Price__c,Product_Description__c,Unit_Price__c From Product__c where Name LIKE:search];
            }
        else{
        allProducts = [Select Id,Name,Product_Name__c,Price__c,Product_Description__c,Unit_Price__c From Product__c];      
        }
        return null;
    }


   
    

}