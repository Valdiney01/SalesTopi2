public class AccountValidator{
    
    public List<Account> validateDocumentNumber (List<Account> accounts){
        BrazilianDocumentValidator validator = new BrazilianDocumentValidator();

        for (Account account : accounts){
            if ( !validator.isCNPJ( account.Cnpj__c ) ){
                account.Cnpj__c.addError('Invalido');  
                System.debug('Validou CNPJ');
            }
            if ( !validator.isCPF( account.Cpf__c ) ){
                account.Cpf__c.addError('Invalido'); 
                System.debug('Validou CPF');
            }
            if(validator.isCPF( account.Cpf__c )){
                account.Cpf__c= account.cpf__c.subString(0, 3) + '.' + account.Cpf__c.subString(3, 6) + '.' +
                account.Cpf__c.subString(6, 9) + '-' + account.Cpf__c.subString(9, 11);
                System.debug('Formatou CPF');
            }
            if(validator.isCnpj( account.Cnpj__c )){
                account.Cnpj__c= account.cpf__c.subString(0, 2) + '.' + account.Cnpj__c.subString(2, 5) + '.' +
                account.Cnpj__c.subString(5, 8) + '/' + account.Cnpj__c.subString(8, 12) + '-' +  account.Cnpj__c.subString(12, 14);
                System.debug('Formatou CNPJ');   
            }
            if(Account.BillingPostalCode != null){
               	Account.BillingPostalCode = Account.BillingPostalCode.subString(0, 5) + '-' + Account.BillingPostalCode.subString(5, 8);
                System.debug(account.BillingPostalCode);
                System.debug('Formatou Cep 1'); 
            }
            if(Account.ShippingPostalCode != null){
               	Account.ShippingPostalCode = Account.ShippingPostalCode.subString(0, 5) + '-' + Account.ShippingPostalCode.subString(5, 8);
                System.debug(account.ShippingPostalCode);
                System.debug('Formatou Cep 2'); 
            }
    
        }
        return accounts;
    }
}