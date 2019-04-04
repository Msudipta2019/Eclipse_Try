global class AccountNamingBatch implements Database.Batchable<Sobject>,Database.stateful
{
    integer i=0;
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        string query= 'select id,name from account' ;
        system.debug('OUTPUT::'+Database.getQueryLocator(query));
     return Database.getQueryLocator(query);   
    }
    
    global void execute(Database.BatchableContext bc, list<account> scope)
    {
        for(account acc: scope)
        { 
            string accnm= acc.name;
            if( !accnm.contains('_nonProd55'))
            {
            acc.name=acc.name+ '_nonProd55'+i;
                i=+1;
            }
        }
        update scope;
        
    }
    
    
    global void finish(Database.BatchableContext bc)
    {
        
        
    }

}