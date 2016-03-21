/*  This class is the controller class for CalculateAllowance VF page.
 *
 * Functionality: This class overrides the standard save method of StandardController.  
 * 
 *   
 * Revision History: 
 *
 * Version     Author            Date         Description 
 * 1.0         Tushar Kakade     21/03/2016   Initial Draft 
*/

public class AllowanceController {
    
    public ApexPages.StandardController sc;
    
    public static Boolean allowanceDetailsRender{get;set;} 
    
    //Controller accepting StandardController of page as parameter.
    public AllowanceController(ApexPages.StandardController sc) {
        this.sc = sc;
        allowanceDetailsRender=False;
    }
    
    //Save the record and stay on the same page.
    public PageReference save() {
        allowanceDetailsRender=True;
        PageReference samePage = sc.save();
        return null;
    }

}