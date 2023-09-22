import { LightningElement, wire } from 'lwc';
import fetchCaseRecords from '@salesforce/apex/FetchCaseRecords.fetchCaseRecords';

const columns = [
    { label: 'Case Number', fieldName: 'CaseNumber', type: 'text' },
    { label: 'Case Id', fieldName: 'Id', type: 'text' },
    { label: 'Case Status', fieldName: 'Status', type: 'text' },
    { label: 'Case Priority', fieldName: 'Priority', type: 'text' }
];
export default class FirstComponent_01 extends LightningElement {
    data =[];
    columns = columns;

    @wire(fetchCaseRecords)
    wiredResult({data, error}){
        if(data){
            this.data = data.map(item => ({
                Id: item.Id,
                CaseNumber: item.CaseNumber,
                Status : item.Status,
                Priority : item.Priority
            }));
        }
        else {
            console.error(error);
        }
    }
}
