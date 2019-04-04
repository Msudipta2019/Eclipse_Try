public class AccountTriggerHelper {
    public static void ContactOnAccount(list<account> acc)
    {
        list<contact> concc= new list<contact>();
        
        for(account acccon: acc)
        {
            
            contact con=new contact();
            con.AccountId=acccon.id;
            con.Description=acccon.Description;
            con.LastName  =acccon.Name;
            concc.add(con);
        }
        if(!concc.isempty())
        {
            insert concc;
        }
        
    }
    
    public static void communicationCheck(list<account> acc)
    {
        list<Account_Communication__c> updatemp= new list<Account_Communication__c>([select id,opted__c,account__c,Communication_Mode__c from 
                                                                                     Account_Communication__c where 
                                                                                     account__c IN: acc]);
        
        
        
        for(account accnt : acc) 
        {   
            
            list<string> cnn=  ParseMultiSelect(accnt); 
            for(string load : cnn)
            {
                integer v =[select count() from Account_Communication__c where account__c=: acc and Communication_Mode__c=:load];
                SYSTEM.debug('V:'+ v);
                if(v==0)
                    
                {accountCommunication(acc);}
            }
            
            
            
            for(Account_Communication__c pmc: updatemp)
            {
                
                
                if(!cnn.contains(pmc.Communication_Mode__c))
                {
                    system.debug('pmc:'+ pmc.opted__c );
                    pmc.opted__c=false;
                    
                }
                else if ((cnn.contains(pmc.Communication_Mode__c)) && pmc.opted__c==false)
                {
                    pmc.opted__c=true; 
                }
                
                
            }
            
        }
        update(updatemp);
    }
    
    public static void accountCommunication(list<account> acc)
    {
        
        
        list<string> asss= new list<string>();
        list<Account_Communication__c> mpm= new list<Account_Communication__c>();        
        list<Account_Communication__c> possiblemp= new  list<Account_Communication__c>([select id,Communication_Mode__c,Opted__c from
                                                                                        Account_Communication__c where account__c IN:   acc]);                                                                
        
        system.debug('wewe1:'+possiblemp );
        for(account a:acc)
        {
            asss=ParseMultiSelect(a);   
            system.debug('wewe2:'+asss );
            
            if(possiblemp.size() == 0)
            {
                for(string c: asss)
                {
                    Account_Communication__c mp= new Account_Communication__c( account__c=a.Id,Communication_Mode__c=c,Opted__c=true);
                    mpm.add(mp);  
                    system.debug('wewe10:'+mpm ); 
                }
            }
            else
            {
                for(Account_Communication__c  p : possiblemp)
                {         
                    
                    
                    for(string c: asss)
                    {
                        system.debug('wewe3:'+c ); 
                        
                        if(p.Communication_Mode__c!=c)
                        { system.debug('wewe4:'+p.Communication_Mode__c );
                         Account_Communication__c mp= new Account_Communication__c( account__c=a.Id,Communication_Mode__c=c,Opted__c=true);
                         mpm.add(mp);  
                         system.debug('wewe5:'+mpm );
                        }
                        else
                        {
                            system.debug('Log:');
                        }
                    }
                }
            }
        }
        
        if(!mpm.isempty())
        {
            insert mpm;    
        }
    }
    
    public static list<string> ParseMultiSelect(account macc)
    {
        List<string> ls=new List<string>();
        
        
        if(macc.Mode_Of_Communication__c!=null)
        {
            string a=string.valueOf(macc.Mode_Of_Communication__c);
            ls=a.split(';');   
            
        }
        
        
        return ls;  
    }
    
    
}