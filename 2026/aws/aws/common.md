# AWS CLOUDFRONT

## 1. What is AWS CloudFront?

Amazon CloudFront is a Content Delivery Network (CDN) service provided by AWS.

It delivers website content, images, videos, APIs, and application data to users from the nearest geographical location, reducing latency and improving performance.

## 2. How does CloudFront work?

For example:

1. A user opens your website.
2. The request reaches CloudFront.
3. CloudFront checks whether the requested content is available in its cache.
4. If available, CloudFront serves it from the nearest edge location.
5. If not available, CloudFront fetches it from the origin server (S3, ALB, EC2, etc.).
6. CloudFront can cache the response and serve future requests faster.

## 3. What are the benefits of CloudFront?

1. Low latency: Delivers content from nearby edge locations.

2. Caching: Reduces requests to the origin server.

3. Security: Integrates with AWS WAF and AWS Shield.

4. HTTPS: Supports SSL/TLS certificates through ACM.

5. Scalability: Handles high volumes of traffic.

6. Cost optimization: Reduces origin data transfer and server load.






====================================================
Latency

Latency is the time delay between sending a request and receiving a response.

Latency is the time taken for data to travel from the source to the destination. 

Low latency means less delay and faster response, 

while high latency means more delay and slower response.

====================================================
TTL

AWS TTL (Time To Live) is a mechanism that automatically expires or deletes data after a specified period.


## TTL in common AWS services

DynamoDB  -  Automatically deletes expired items based on a TTL attribute (Unix epoch timestamp). 


 ElastiCache  -   Automatically expires cache keys after a specified duration. 


 API Gateway  -   Uses TTL for API caching. 


 CloudFront  -   Uses TTL to control how long content stays cached at edge locations. 


 SQS  -   Message retention period controls how long messages are stored. 


 Secrets Manager  -   Supports rotation schedules, not standard TTL-based deletion. 


## Example: DynamoDB TTL

Suppose you have a DynamoDB item:

json

```json
{
  "userId": "101",
  "name": "John",
  "ttl": 1793764800
}
```

Here:

- `ttl` is a Unix timestamp in seconds.
- DynamoDB checks whether the timestamp has expired.
- Once expired, DynamoDB asynchronously deletes the item.

Important: DynamoDB TTL deletion is not immediate. It can take several days in some cases.

====================================================

AWS CloudFront TTL (Time To Live)
CloudFront TTL determines how long Amazon CloudFront keeps cached content at its edge locations before checking the origin server (such as S3, EC2, or an ALB) for updated content.

In simple terms, TTL controls how long CloudFront serves cached content without contacting your origin.


What is the difference between Minimum TTL, Default TTL, and Maximum TTL?

Minimum TTL: Minimum allowed caching duration.

Default TTL: Used when the origin doesn't provide caching headers.

Maximum TTL: Maximum allowed caching duration.


====================================================
====================================================
====================================================