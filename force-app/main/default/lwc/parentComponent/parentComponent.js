import { LightningElement } from 'lwc';
export default class ParentComponent extends LightningElement {

message = 'Updated count will appear here!';
value='value from parent component';
    updateMessage(event) {
        this.message = event.detail.message;
    }
}