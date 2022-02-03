({
        gotoAboutUs : function (component, event, helper) {
            var urlEvent = $A.get("e.force:navigateToURL");
            urlEvent.setParams({
              "url": "/about-us"
            });
            urlEvent.fire();
        },
   	 	gotoCareers : function (component, event, helper) {
            var urlEvent = $A.get("e.force:navigateToURL");
            urlEvent.setParams({
                "url": "/careers"
            });
            urlEvent.fire();
        },
       	gotoContactUs : function (component, event, helper) {
            var urlEvent = $A.get("e.force:navigateToURL");
            urlEvent.setParams({
                "url": "/contact-us"
            });
            urlEvent.fire();
        },
        gotoPrivacyPolicy : function (component, event, helper) {
            var urlEvent = $A.get("e.force:navigateToURL");
            urlEvent.setParams({
                "url": "/privacy-policy"
            });
            urlEvent.fire();
        },
        gotoTerms : function (component, event, helper) {
            var urlEvent = $A.get("e.force:navigateToURL");
            urlEvent.setParams({
                "url": "/terms-of-service"
            });
            urlEvent.fire();
        },
        gotoFaq : function (component, event, helper) {
            var urlEvent = $A.get("e.force:navigateToURL");
            urlEvent.setParams({
                "url": "/faq"
            });
            urlEvent.fire();
        },
        gotoOrder : function (component, event, helper) {
            var urlEvent = $A.get("e.force:navigateToURL");
            urlEvent.setParams({
                "url": "/order-book"
            });
            urlEvent.fire();
        },
        gotoPublish : function (component, event, helper) {
            var urlEvent = $A.get("e.force:navigateToURL");
            urlEvent.setParams({
                "url": "/publish-book"
            });
        urlEvent.fire();
        }		
})