import { LightningElement, api, track } from 'lwc';

export default class BookDetails extends LightningElement {

    cover = "https://images1.penguinrandomhouse.com/cover/9780143134206";
    title = "The Little Drummer Girl";
    author = "John le Carré";
    @track genres = [
        "Fiction", "Mystery", "Thriller"
    ]
    year = "1/1/2020";
    isbn = "9780143134206";

    synopsis = "The story follows the manipulations of Martin Kurtz, an Israeli spymaster who intends to kill Khalil – a Palestinian terrorist who is bombing Jewish-related targets in Europe, particularly Germany – and Charlie, an English actress and double agent working on behalf of the Israelis.";

}