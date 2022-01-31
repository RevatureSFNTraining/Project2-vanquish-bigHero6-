({
    myAction : function(component, event, helper) {

    },

    loadSearchResults: function (component, event, helper) {
        var action = component.get("c.getSearchResults");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == 'SUCCESS') {
                console.log(response);
            }
        }, 'Carré');
        $A.enqueueAction(action);
    }
})
