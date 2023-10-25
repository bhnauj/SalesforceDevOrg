import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from 'lightning/actions';

export default class DirectonInfo extends LightningElement {

    

    @api recordId;
    handleSubmit(event) {
        console.log('onsubmit event recordEditForm'+ event.detail.fields);
        const toastEvent = new ShowToastEvent({
            title: 'Success!',
            message: 'Direction Info has been updated Successfully',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(toastEvent);

        this.dispatchEvent(new CloseActionScreenEvent());
        

    }
    handleSuccess(event) {
        console.log('onsuccess event recordEditForm', event.detail.id);
        
        
    }
    handleCancel(event){
        this.dispatchEvent(new CloseActionScreenEvent());
    }
}