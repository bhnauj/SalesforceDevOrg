@RestResource(urlMapping='/AccountDetails/*')
global class showAccount
{
@HttpGet   
global static Account doGet()
{
restrequest req =restcontext.request;
restresponse res=restcontext.response;
string accountid=req.requesturi.substring(req.requesturi.lastindexof('/')+1);
String str=req.requesturi.substring(0,req.requesturi.lastindexof('/'));
string phone =str.substring(str.lastindexof('/')+1);    
system.debug('account id'+accountid);
system.debug('phone'+phone);
account result=[select id, name,phone from account where id=:accountid AND phone=:phone];
return result;
}
}