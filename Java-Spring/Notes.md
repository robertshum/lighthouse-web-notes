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