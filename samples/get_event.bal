import ballerina/log;
import ballerinax/googleapis_calendar as calendar;

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;
configurable string refreshUrl = ?;
configurable string calendarId = ?;
configurable string eventId = ?;

public function main() {
  
    calendar:CalendarConfiguration config = {
        oauth2Config: {
            clientId: clientId,
            clientSecret: clientSecret,
            refreshToken: refreshToken,
            refreshUrl: refreshUrl
        }
    };
    calendar:Client calendarClient = new (config);

    calendar:Event|error res = calendarClient->getEvent(calendarId, eventId);
    if (res is calendar:Event) {
        log:print(res.id);
    } else {
        log:printError(res.message());
    }
}
