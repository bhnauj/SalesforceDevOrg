public with sharing class orderProductEntryExtension {


    public set<id> pid= new set<id>(); 
    public String searchString {get;set;}
    public String searchstring2 {get;set;} 
    public Product__c[] allProducts {get;set;}
    public Order_Line_Item__c[] shoppingCart {get;set;}
    public String toUnselect {get; set;}
    public string state {get;set;}
    private Order_Line_Item__c [] forDeletion = new Order_Line_Item__c []{};
    public string toselect{get;set;}
    public map<Id,Product__c> MapOrder{get;set;}
    
    public orderProductEntryExtension() {
    
    MapOrder = new  map<Id,Product__c >();
    shoppingCart = [select Id,Quantity__c,Product__c,Price__c,Order__c,Product__r.name,Product__r.Unit_Price__c from  Order_Line_Item__c where Order__c='a0Y6F00000KF7a9'];
       
       for(Order_Line_Item__c oli:shoppingCart ){
       
       pid.add(oli.Product__c);
       
       
       }
       allProducts = [select Id,Name,Product_Name__c,Price__c,Product_Description__c,Unit_Price__c from  Product__c where id not IN :pid];
       for(Product__c p:allProducts)
       {
       MapOrder.put(p.Id,p);
       }
        }
    
    public PageReference removeFromShoppingCart(){
    
        // This function runs when a user hits "remove" on an item in the "Selected Products" section
    
        
    List<Order_Line_Item__c> oLst = [Select Id from Order_Line_Item__c where id=:toUnselect];
    delete oLst;
       
        
     PageReference pageRef = new PageReference('/apex/createorderpage');
            return pageRef;
    }
    
    
        public pagereference addlineitem()
        {     
        Order_Line_Item__c ol = new Order_Line_Item__c();
        ol.Order__c='a0Y6F00000KF7a9';
        ol.Quantity__c=1;
        ol.Product__c=toselect;              
            insert ol;
            PageReference pageRef = new PageReference('/apex/createorderpage');
            return pageRef;

            
        }   
    
    }