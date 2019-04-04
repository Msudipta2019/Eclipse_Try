public with sharing class myProductController {
    @AuraEnabled
    public static List<product2> findProperties (Id recordId, Decimal priceRange) {
        List<product2> property = [SELECT Price__c FROM product2 WHERE Id=:recordId];
        Decimal propertyPrice = property[0].Price__c;
        List<product2> similarProperties = getSimilarProperties(recordId, priceRange, propertyPrice);
        return similarProperties;
    }
    private static List<product2> getSimilarProperties (Id recordId, Decimal priceRange, Decimal price ) {
    Decimal range;
    if (priceRange == null) {
        range = 100000;
    } else {
        range = priceRange;
    }
    return [
        SELECT Id, Name,Price__c
        FROM product2 WHERE Id != :recordId AND Price__c > :price - range AND Price__c < :price + range];
    }
}