import { LightningElement, track, wire, api } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import getAuthorById from '@salesforce/apex/AuthorController.getAuthorById';
import getBooksByAuthor from '@salesforce/apex/Product2Controller.getBooksByAuthor';
export default class AuthorDetails extends LightningElement {

    currentPageReference = null; 
    urlStateParameters = null;

    urlId = null;
    @track books = [];
    //@api book = {};
    @track author = {};
    error = null;

    // Handle click book event and redirects to page containing book's information.
    handleClickBook(event) {
        let targetId = event.target.dataset.targetId;
        let target = this.template.querySelector(`[data-target-id="${targetId}"]`);

        let urlString = window.location.href;
        let bookUrl = urlString.substring(0, urlString.indexOf("/s")) + '/s/book-details?id=' + targetId;
        window.open(bookUrl);
    }

    // Executes when page loads.
    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
       if (currentPageReference) {
          this.urlStateParameters = currentPageReference.state;
          this.urlId = this.urlStateParameters.id || null;

          getAuthorById({authorId : this.urlId})
            .then(result => {
                console.log(result);
                this.author = result;

                let urlString = window.location.href;
                let baseURL = urlString.substring(0, urlString.indexOf("/s"));
                this.bookUrl = baseURL + '/s/book-details?id=';

                getBooksByAuthor({authorName : this.author.Name})
                    .then(data => {
                        
                        console.log(data);
                        this.books = data;
                    })
                    .catch(error => {
                        this.error = error;
                    });

            })
            .catch(error => {
                this.error = error;
            });

            
       }
    }
   
}