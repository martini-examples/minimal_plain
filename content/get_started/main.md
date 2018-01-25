title: "Get started"
+++

In this tutorial, we will

1. use `jaguar` cli to clone a boilerplate repository
2. Examine the boilerplate example
3. Test run the boilerplate example

{{< asciinema id="125171" size="small" />}}

# 1. Installation

`jaguar` cli has some nifty commands to clone boilerplate projects and assist in code generation. Install it using the following command:

`pub global activate jaguar_cli`

# 2. List available boilerplate/examples

`list::projects` command of `jaguar` cli lists all available boilerplate/examples.

`jaguar list::projects`

> ...  
> boilerplate_reflect: Boilerplate for jaguar_reflect  
> ...  

In this example, we will be using [boilerplate_reflect](https://github.com/jaguar-examples/boilerplate_reflect). Since it uses, source generation instead of reflection, it is much easier to get started.

# 3. Clone the project

Lets use `create::project` command of `jaguar` cli to clone the desired boilerplate.

`jaguar create::project -r boilerplate_reflect`

# 4. pub get

Lets resolve all pub dependencies.

`pub get`

# 5. Examine the example

You might want to peek at the following files:

1. [lib/api.dart](https://github.com/jaguar-examples/boilerplate_reflect/blob/master/lib/api.dart)
Declares the routes and route handlers
2. [bin/server.dart](https://github.com/jaguar-examples/boilerplate_reflect/blob/master/bin/server.dart)
Main file for server
3. [bin/client.dart](https://github.com/jaguar-examples/boilerplate_reflect/blob/master/bin/client.dart)
Main file for client. `dart:io` based client to test run the sample routes.

# 6. Test run

Run the server:

`dart bin/server.dart`

Run the client:

`dart bin/client.dart`

The client prints the response it received from the server on the terminal. It must be something similar to this:

> =========================  
> body:  
> 0.1  
> statusCode:  
> 200  
> headers:  
> x-frame-options: SAMEORIGIN  
> content-type: text/plain; charset=utf-8  
> x-xss-protection: 1; mode=block  
> x-content-type-options: nosniff  
> transfer-encoding: chunked  
> ...  
> ...  

# 7. Where to go from here

## 7.1 IDE
We recommend installing [IntelliJ IDE](https://www.jetbrains.com/idea/) and [Dart plugin for IntelliJ IDE](https://plugins.jetbrains.com/plugin/6351-dart). We believe IntelliJ is the best IDE available for Dart. It makes developing Jaguar.dart applications a breeze.

Alternatively, [atom.io](https://atom.io/) with [dart plugin](https://atom.io/packages/dartlang) is also a good editor.

## 7.2 Digging deeper into Jaguar.dart

[Jaguar.dart wiki](https://github.com/Jaguar-dart/jaguar/wiki) has several articles on introduction to various parts of Jaguar framework.