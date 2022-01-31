import { LightningElement, track, wire, api } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import getAuthorById from '@salesforce/apex/AuthorController.getAuthorById';
import getBooksByAuthor from '@salesforce/apex/Product2Controller.getBooksByAuthor';
export default class AuthorDetails extends LightningElement {

    cover = "https://images1.penguinrandomhouse.com/cover/9780143134206";

    currentPageReference = null; 
    urlStateParameters = null;

    urlId = null;
    @track books = [];
    @api book = {};
    @track author = {};
    error = null;

    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
       if (currentPageReference) {
          this.urlStateParameters = currentPageReference.state;
          this.urlId = this.urlStateParameters.id || null;

          console.log(this.urlId);

          getAuthorById({authorId : this.urlId})
            .then(result => {
                console.log(result);
                this.author = result;

                getBooksByAuthor({authorName : this.author.Name})
                    .then(data => {
                        console.log('entro');
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

    get bookUrl() {
        return "https://sandbox-voldragpubsergio-developer-edition.cs92.force.com/books?id="  + this.book.Id;
    }
   
}