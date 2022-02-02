({
    helperMethod : function() {

    },
    getContacts : function(component) {
        var action = component.get("c.getBookCards");
        
        //Set up the callback
        //var self = this;
        action.setCallback(this, function(actionResult) {
            var state = actionResult.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.bookCards", actionResult.getReturnValue());
            }            
        });
        $A.enqueueAction(action);
    }

})
