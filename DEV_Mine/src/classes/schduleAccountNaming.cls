global class schduleAccountNaming implements Schedulable {

   global void execute(SchedulableContext ctx) {
      AccountNamingBatch p = new AccountNamingBatch();
        database.executeBatch(p);
   }   
}