# Problem 1 - [Prime Time](https://protohackers.com/problem/1)

To keep costs down, a hot new government department is contracting out its mission-critical primality testing to the lowest bidder. (That's you).

Officials have devised a JSON-based request-response protocol. Each request is a single line containing a JSON object, terminated by a newline character (`'\n'`, or ASCII 10). Each request begets a response, which is also a single line containing a JSON object, terminated by a newline character.

After connecting, a client may send multiple requests in a single session. Each request should be handled in order.

A conforming request object has the required field `method`, which must always contain the string `"isPrime"`, and the required field `number`, which must contain a number. Any JSON number is a valid number, including floating-point values.

Example request:

```JSON
{"method":"isPrime","number":123}
```

A request is malformed if it is not a well-formed JSON object, if any required field is missing, if the method name is not `"isPrime"`, or if the `number` value is not a number.

Extraneous fields are to be ignored.

A conforming response object has the required field `method`, which must always contain the string `"isPrime"`, and the required field `prime`, which must contain a boolean value: `true` if the number in the request was prime, `false` if it was not.

Example response:

```JSON
{"method":"isPrime","prime":false}
```

A response is malformed if it is not a well-formed JSON object, if any required field is missing, if the method name is not `"isPrime"`, or if the `prime` value is not a boolean.

A response object is considered *incorrect* if it is well-formed but has an incorrect `prime` value. Note that non-integers can not be prime.

Accept TCP connections.

Whenever you receive a conforming request, send back a correct response, and wait for another request.

Whenever you receive a *malformed* request, send back a single *malformed* response, and disconnect the client.

Make sure you can handle at least 5 simultaneous clients.