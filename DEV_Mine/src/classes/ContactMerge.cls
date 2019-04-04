public class ContactMerge {
    
    
    public static void ContactMergeduplicate(list<Contact> con)
    {
        system.debug('HELLO CONTACT:::'+ con);
         list<case> css= new list<case>();
        list<Contact> excon= new list<Contact>();
        system.debug('HELLO CONTACT123:::'+ con);
               
        for (contact cc : con)
        {
             system.debug('CON NAME:::'+ cc.FirstName);
            integer reo=[select id,name,accountid from contact where FirstName=: cc.FirstName and accountid= :cc.AccountId].size();
            system.debug('excon' + reo);
            if(reo>0){
                for(contact cmm:[select id,LastName,FirstName,accountid from contact where FirstName=: cc.FirstName and accountid=:cc.AccountId]){
                    cmm.LastName=cmm.LastName+'_Old';
                    excon.add(cmm);
                }
            }
           
            if(!excon.isEmpty())
            { 
               delete excon;
            }
        }
        
        
        
    }
}