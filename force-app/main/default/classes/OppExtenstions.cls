public with sharing class OppExtenstions {

public static string Num2Word(long MyNumber1)
{
   return 'text';
}

 public static String english_number(long val) {  
 
 string  x = Num2Word(25000, true);
  return Num2Word(25000);
 }

 
 
 public  static  String  Retstring;
public  static   String[] st1 = new String[] { '', 'One', 'Two', 'Three', 'Four', 'Five', 'Six','Seven', 'Eight', 'Nine' };
public  static   String[] st2 = new String[]{ 'Hundred', 'Thousand', 'Lakh', 'Crore' };
public  static   String[] st3 = new String[]{ 'Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen','Fifteen', 'Sixteen', 'Seventeen', 'Eighteen', 'Ninteen' };
public  static   String[] st4 = new String[] { 'Twenty', 'Thirty', 'Fourty', 'Fifty', 'Sixty', 'Seventy','Eighty', 'Ninty' };


 public  static  String Num2Word(integer Innumber,Boolean x) {
  integer n = 1;
  integer word;
  Retstring = '';
  while (Innumber != 0) {
   //switch (n) {
   if (n == 1){  // case 1:
    word = math.mod (Innumber , 100);
    pass(word);
    if (Innumber > 100 && math.mod(Innumber , 100) != 0) {
     show('and ');
    }
    Innumber /= 100;
    //break;
    }
   if (n == 2){  // case 1:   case 2:
    word = math.mod(Innumber , 10);
    if (word != 0) {
     show(' ');
     show(st2[0]);
     show(' ');
     pass(word);
    }
    Innumber /= 10;
    //break;
    }
       if (n == 3){  // case 1:case 3:
    word = math.mod(Innumber , 100);
    if (word != 0) {
     show(' ');
     show(st2[1]);
     show(' ');
     pass(word);
    }
    Innumber /= 100;
    //break;
    }
       if (n == 4){  // case 1:case 4:
    word = math.mod(Innumber , 100);
    if (word != 0) {
     show(' ');
     show(st2[2]);
     show(' ');
     pass(word);
    }
    Innumber /= 100;
    //break;
    }
       if (n == 5){  // case 1:case 5:
    word = math.mod(Innumber , 100);
    if (word != 0) {
     show(' ');
     show(st2[3]);
     show(' ');
     pass(word);
    }
    Innumber /= 100;
   // break;
   }
   //}
   n++;
  }
  return 'Rupees '+ Retstring+ ' Only';
 }


 public static  void pass(integer ynumber) {
  integer word, q;
  if (ynumber < 10) {
   show(st1[ynumber]);
  }
  if (ynumber > 9 && ynumber < 20) {
   show(st3[ynumber - 10]);
  }
  if (ynumber > 19) {
   word = math.mod(ynumber , 10);
   if (word == 0) {
    q = ynumber / 10;
    show(st4[q - 2]);
   } else {
    q = ynumber / 10;
    show(st1[word]);
    show(' ');
    show(st4[q - 2]);
   }
  }
 }


 public static void show(String s) {
  String st;
  st = Retstring;
  Retstring = s;
  Retstring += st;
 }
 
 
 
}