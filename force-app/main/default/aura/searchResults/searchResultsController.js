({
    doInit : function(component, event, helper) {

        var action=component.get("c.searchForString");
        console.log('Action set');
        action.setParams({searchText:'Carre'});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {

                var resp = response.getReturnValue();
                component.set("v.responseObject",resp);
                console.log(resp);
            }
        });
      $A.enqueueAction(action);

    }
})