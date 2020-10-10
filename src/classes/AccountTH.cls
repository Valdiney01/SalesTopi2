public virtual with sharing class AccountTH extends TriggerHandler {
    
    List<Account> newAccounts;  
    Map<Id,Account> oldAccounts;
    AccountFilter filter;
    AccountValidator validator;
    
    public AccountTH () {
        this ( (List<Account>) Trigger.new, (Map<Id,Account>) Trigger.oldMap );
    }
    
    public AccountTH (List<Account> newAccounts , Map<Id,Account> oldAccounts) {
        
        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;
        
        this.filter = new AccountFilter();
        this.validator = new AccountValidator();
        
    }
    
    override
        public void beforeInsert() {
            validateDocumentNumber ();
            System.debug('before insert');
        }   
    
    override
        public void beforeUpdate() {
            validateDocumentNumber ();
            System.debug('before update');
        }
    
    virtual
        public void validateDocumentNumber () {
            System.debug('Chamou a filter');
            List<Account> filterdAccounts = this.filter.filterByChangedDocumentNumber(newAccounts, oldAccounts);
            this.validator.validateDocumentNumber(filterdAccounts);
            
        }
}