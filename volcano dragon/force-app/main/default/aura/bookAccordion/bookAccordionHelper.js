({
    getBooks : function(component) {
        var action = component.get("c.getBookList");
        
        //Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
            var state = actionResult.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.books", actionResult.getReturnValue());
            }            
        });
        $A.enqueueAction(action);
    }
})
