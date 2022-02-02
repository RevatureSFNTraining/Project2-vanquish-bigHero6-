({
    goToAbout_us : function(component, event, helper){
        var navService = component.find("navService");
        var pageReference = {
            	type: 'comm__namedPage',
            	attributes: {
                  name: 'About_Us__c'
        		}
            };
          event.preventDefault();
          navService.navigate(pageReference);

    },
    goToCareers : function(component, event, helper){
        var navService = component.find("navService");
        var pageReference = {
            	type: 'comm__namedPage',
            	attributes: {
                  name: 'career__c'
        		}
            };
          event.preventDefault();
          navService.navigate(pageReference);

    },
    goToContact_Us : function(component, event, helper){
        var navService = component.find("navService");
        var pageReference = {
            	type: 'comm__namedPage',
            	attributes: {
                  name: 'Contact_Us__c'
        		}
            };
          event.preventDefault();
          navService.navigate(pageReference);

    },
    goToPrivacy : function(component, event, helper){
        var navService = component.find("navService");
        var pageReference = {
            	type: 'comm__namedPage',
            	attributes: {
                  name: 'Privacy_Policy__c'
        		}
            };
          event.preventDefault();
          navService.navigate(pageReference);

    },
    goToTermsOfService : function(component, event, helper){
        var navService = component.find("navService");
        var pageReference = {
            	type: 'comm__namedPage',
            	attributes: {
                  name: 'terms__c'
        		}
            };
          event.preventDefault();
          navService.navigate(pageReference);

    }
})