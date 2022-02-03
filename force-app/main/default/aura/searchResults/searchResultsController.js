({
    doInit : function(component, event, helper) {
        
    },

    
    handleSearchEvent: function(component, event) {

        var action=component.get("c.searchForString");
        console.log('Action set');

        var searchKey = event.getParam('searchKey');
        console.log(searchKey);

        action.setParams({searchText: searchKey});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {

                var resp = response.getReturnValue();
                component.set("v.responseObject",resp);
                console.log(resp);

                let urlString = window.location.href;
                let baseUrl = urlString.substring(0, urlString.indexOf("/s")) + '/s';
                component.set("v.url", baseUrl);

                component.set("v.searchKey", searchKey);
            }
        });
      $A.enqueueAction(action);
    },
})