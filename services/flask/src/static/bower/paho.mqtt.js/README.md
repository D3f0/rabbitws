 Paho.mqtt.js
==============
The Paho JavaScript Client is a browser-based library that uses WebSockets to connect
to an MQTT server.  

Only expose a single object name in the global namespace. Everything must go through
this module. Global Paho.MQTT module only has a single public function, client, which
returns a Paho.MQTT client object given connection details.

The source of the client is in:
```
    src/mqttws31.js
```

### Send & Receive messages using web browsers.

> This programming interface lets a Javascript client application use the MQTT V3.1 or
  V3.1.1 protocol to connect to an MQTT-supporting messaging server.

### Then function supported includes:

> * Connecting to and disconnecting from server.The server is identified by its host name and port number.
> * Specifying options that relate to the communications link with the server, for example the frequency
    of keep-alive heartbeats, and whether SSL/TLS is required.
> * Subscribing to and receiving messages from MQTT Topics.
> * Publishing messages to MQTT Topics.

### The API consists of two main objects:

**{@link Paho.MQTT.Client}**
> This contains methods that provide the functionality of the API,
  including provision of callbacks that notify the application when a message
  arrives from or is delivered to the messaging server,
  or when the status of its connection to the messaging server changes.

**{@link Paho.MQTT.Message}**
> This encapsulates the payload of the message along with various attributes
  associated with its delivery, in particular the destination to which it has
  been (or is about to be) sent.

> The programming interface validates parameters passed to it, and will throw
  an Error containing an error message intended for developer use, if it detects
  an error with any parameter.

### Example

```JavaScript

client = new Paho.MQTT.Client(location.hostname, Number(location.port), "clientId");
client.onConnectionLost = onConnectionLost;
client.onMessageArrived = onMessageArrived;
client.connect({onSuccess:onConnect});
function onConnect() {
  // Once a connection has been made, make a subscription and send a message.
  console.log("onConnect");
  client.subscribe("/World");
  message = new Paho.MQTT.Message("Hello");
  message.destinationName = "/World";
  client.send(message); 
};
function onConnectionLost(responseObject) {
  if (responseObject.errorCode !== 0)
    console.log("onConnectionLost:"+responseObject.errorMessage);
};
function onMessageArrived(message) {
  console.log("onMessageArrived:"+message.payloadString);
  client.disconnect(); 
};
```
