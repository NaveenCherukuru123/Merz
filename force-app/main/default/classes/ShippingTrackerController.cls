public class ShippingTrackerController {

    // even more best option would be to store in named credentials
    public static final string ENDPOINT = 'https://merzcommunities--mel.sandbox.my.salesforce-sites.com/services/apexrest/mockShipmentStatus?trackingNumber=anystringwilldo';

    @AuraEnabled(cacheable=true continuation=true)
    public static Object startRequest() {
        Continuation con = new Continuation(120); 
        con.continuationMethod = 'processResponse';

        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(ENDPOINT);

        String calloutLabel = con.addHttpRequest(req);

        return con;
    }

    @AuraEnabled(cacheable=true)
    public static Object processResponse(List<String> labels, Object state) { 
        HttpResponse response = Continuation.getResponse(labels[0]);
        String body = response.getBody();
        return body;
    }
}