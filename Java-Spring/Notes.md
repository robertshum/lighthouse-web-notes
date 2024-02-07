This is a refresher, after a long hiatus from Blackboard in 2017 working on Java and Spring boot.

# Java


## Packages:
namespace in Java that organizes set of related classes + interfaces.  Helps with naming conflicts.  Also serve as access control.  Classes within the SAME package can access each other's members fields, methods and constructors.

However, classes in different packages require the correct access modifiers (eg: public protected and private).

## Jar (Java ARchive):
is a package file format that contain classes, metadata, and resources.  Used to distribute applications or libraries in a single file.  If included with a Manifest file (Meta-inf/Manifest.mf), it can be made as an executable.

# Private, Protected, Public
Fields and methods are...
private = accessible only to the class it was declared in.
protected = accessible only to the class it was declared in + subclasses + same package.
public = accessible to any classes outside and inside the package.

# Spring Boot

What is a Bean

Difference between Configuration and Component

## HATEOAS

Hypermedia as the Engine of Application State is an additional principle that is often associated with REST APIs, but it is not a mandatory requirement for an API to be considered RESTful. HATEOAS is more about how the API is designed and how it provides information to clients about the available actions and resources.

```json
{
   "_links" : {
      "employees" : {
         "href" : "http://localhost:8080/employees"
      },
      "self" : {
         "href" : "http://localhost:8080/employees/1"
      }
   },
   "id" : 1,
   "name" : "Robert",
   "role" : "Software Developer"
}
```

The links to employees / self are an example of HATEOAS.


### HAL

AL (Hypertext Application Language) is a simple and lightweight media type for representing hypermedia controls in RESTful APIs. It is an implementation of HATEOAS (Hypermedia as the Engine of Application State) and is designed to make it easier to create and consume hypermedia-driven APIs.

Resource Representation: HAL represents resources as JSON objects with key-value pairs. Each resource may contain links to related resources, embedded resources, and other metadata.

Hypermedia Links: HAL uses hypermedia links to represent relationships between resources. Links are represented as key-value pairs where the key is the link relation (e.g., "self", "next", "prev") and the value is the URI of the related resource.

Embedded Resources: HAL allows embedding related resources directly within the representation of a parent resource. This can help reduce the number of network requests required to retrieve related resources.

Self-Description: HAL representations are self-descriptive, meaning they contain information about the available actions and resources. Clients can navigate through the API by following hypermedia links included in the HAL responses.

By using HAL, RESTful APIs become more discoverable, self-descriptive, and flexible. Clients can dynamically explore and interact with the API by following hypermedia links, without needing prior knowledge of the API's structure or endpoints. This promotes loose coupling between clients and servers and simplifies the process of API consumption and evolution.

Overall, HAL is a popular choice for implementing HATEOAS in RESTful APIs due to its simplicity, readability, and ease of use with JSON. It helps improve the usability and scalability of RESTful APIs by providing a standardized way to represent hypermedia controls.

Example of HAL in action, as a blog post resource:

```json
{
  "id": 123,
  "title": "Sample Blog Post",
  "content": "This is a sample blog post content.",
  "_links": {
    "self": {
      "href": "/posts/123"
    },
    "author": {
      "href": "/users/456"
    },
    "comments": {
      "href": "/posts/123/comments"
    }
  }
}
```