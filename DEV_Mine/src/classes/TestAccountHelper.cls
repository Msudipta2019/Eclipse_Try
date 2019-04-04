@istest
private class TestAccountHelper {

    @istest
    private static void accountinsert()
    {
        list<account> acc= new list<account>();
        
        for(integer i=0; i<200 ; i++)
        {
            account accp =new account();
            accp.Name='Test'+ i;
            accp.Phone='400465656';
            accp.Mode_Of_Communication__c='Fax';
            acc.add(accp);
            
        }
        
         test.startTest();
          insert(acc);
         test.stopTest();
        
    }
    
    
}