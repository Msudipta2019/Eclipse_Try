public class CaseTriggerHelper {

    public static void caseAssingedTo(list<case> caseassign)
    {
       for(case cc: caseassign)
           
       {
           cc.Assinged_To__c=UserInfo.getUserId();
           if(cc.Status=='Closed')
           {
           cc.RecordTypeid='0120o000001YvitAAC';
           }
           
       }
    }
      public static void caseStatus(list<case> caseassign)
    {
       map<string,string> caserelate=new map<string,string>();
        string caseres;
        string casestatus;
        for(Case_Relation__mdt cc: [select Case_Role__c,status__c from Case_Relation__mdt])
        {
            caserelate.put(cc.Case_Role__c,cc.status__c);
                       
        }
        system.debug('Map Display'+caserelate);
        for(case ccn:caseassign)
        {
             caseres=ccn.Case_Reason_Type__c;
            if(caserelate.containskey(caseres) && ccn.Status!='Closed')
            {
                
                ccn.Status=caserelate.get(caseres);
                
            }
            
            
            
        }
        
        
    }
    
}