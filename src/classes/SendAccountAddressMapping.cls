public class SendAccountAddressMapping {
    @future (callout = true)
    public static void sendAccount(){
        HTTP http = new HTTP();
        httpRequest Request = new httpRequest();
        Request.setMethod('PUT');
        Request.setEndPoint('https://bisso-topirun-20-dev-ed.my.salesforce.com/services/apexrest/api/account/geolocation');
        String payload = '{"name": "Teste do Bisso","externalId": "23423423432423","billingAddress" : {"street": "Rua Pedro Dias Batista 70","city": "Águas de Santa Bárbara","zipCode": "18770-970","state": "SP","country": "Brasil"},"shippingAddress" : {"treet": "Rua Coronel Honório Palma 135","city": "Altinópolis","zipCode": "14350-970","state": "SP","country": "Brasil"}}';
        Request.setBody(payload);
        httpResponse response = http.send(Request);    
        if(response.getStatusCode() == 200){
            System.debug('Retorno 200');
        }
    }
//incompleto
}