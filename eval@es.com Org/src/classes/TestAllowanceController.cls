/*  This class is the test class for AllowanceController.
 *
 * Revision History: 
 *
 * Version     Author            Date         Description 
 * 1.0         Tushar Kakade     21/03/2016   Initial Draft 
*/


@isTest
public class TestAllowanceController{
    static testMethod void ValidateAllowance(){
        
        Contact testCont = new Contact(LastName ='Kakade');
        insert testCont; 
        List<Contact> employees = [SELECT id FROM Contact WHERE LastName = 'Kakade'];
        String employeeId = employees[0].id;
        
        
        
        Country_Allowance_Rate__c testCountry = new Country_Allowance_Rate__c(Name = 'Switzerland', Allowance_Rate__c = 62 ); 
        insert testCountry;
        List<Country_Allowance_Rate__c > countries = [SELECT id FROM Country_Allowance_Rate__c WHERE Name = 'Switzerland'];
        String countryId = countries[0].id;
        
        PageReference pageRef = new PageReference('/apex/CalculateAllowance');
        System.Test.setCurrentPage(pageRef);
        
        
        Allowance__c allowance = new Allowance__c();
        allowance.Employee__c = employeeId;
        allowance.Country_Allowance_Rate__c =  countryId; 
        allowance.Number_of_Breakfasts__c = 5;
        allowance.Number_of_Lunches_Dinners__c = 6;
        allowance.Kilometers_Travelled__c = 10;
        
        
        Test.startTest();
        ApexPages.StandardController sc =new ApexPages.StandardController(allowance);
        AllowanceController allowCtrl = new AllowanceController(sc);
        PageReference returnFromSave = allowCtrl.save();
        System.assertEquals(returnFromSave,Null);
        Test.stopTest();              
    }
}