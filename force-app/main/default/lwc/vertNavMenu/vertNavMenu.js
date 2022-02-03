import { LightningElement,api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class NavToHome extends NavigationMixin(LightningElement) {
    
    @api navigateToAboutUs;
    @api navigateToCareers;
    @api navigateToContactUs;
    @api navigateToPrivacy;
    @api navigateToTermsOfService;
         
       //{
        // Use the built-in 'Navigate' method
        //this[NavigationMixin.Navigate]({
            // Pass in pageReference
           // type: 'comm__namedPage',
           // attributes: {
            //    name: 'About_Us__c'
          //  }
       // });
    //}
}