public class  contactsavecontroller {
public contact con {get; set;}

public contactsavecontroller ()
{
con =new contact();
}
public pagereference save(){
    if(con!=null)
insert con;


  List<Messaging.SingleEmailMessage> mails = 
  new List<Messaging.SingleEmailMessage>();
  
 
      // Step 1: Create a new Email
      Messaging.SingleEmailMessage mail = 
      new Messaging.SingleEmailMessage();
    
      // Step 2: Set list of people who should get the email
      List<String> sendTo = new List<String>();
      sendTo.add(con.Email);
      mail.setToAddresses(sendTo);
    
      // Step 3: Set who the email is sent from
      mail.setReplyTo(con.Email);
      mail.setSenderDisplayName('Official Bank of Nigeria');
    
      // (Optional) Set list of people who should be CC'ed
      List<String> ccTo = new List<String>();
      ccTo.add(con.Email);
      mail.setCcAddresses(ccTo);

      // Step 4. Set email contents - you can use variables!
      mail.setSubject('URGENT BUSINESS PROPOSAL');
      String body = 'Dear ' + con.FirstName + ', ';
      body += 'I confess this will come as a surprise to you.';
      body += 'I am John Alliston CEO of the Bank of Nigeria.';
      body += 'I write to request your cooperation in this ';
      body += 'urgent matter as I need a foreign partner ';
      body += 'in the assistance of transferring $47,110,000 ';
      body += 'to a US bank account. Please respond with ';
      body += 'your bank account # so I may deposit these funds.';
      mail.setHtmlBody(body);
    
      // Step 5. Add your email to the master list
      mails.add(mail);
  
  // Step 6: Send all emails in the master list
  Messaging.sendEmail(mails);
 
return null;

}


}