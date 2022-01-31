import { LightningElement,api } from 'lwc';

export default class VerticalNavigationMenu extends LightningElement {

    @api about;
    @api employ;
    @api gen;
    @api book;
    @api privacy;
    @api contact;
}