# Java SpringBoot Best Pratices Application Template

This is a simple functional project that I've created to be used as a template and a reference when creating new projects. It is very important to keep in mind that my goal is to build a well-structured architecture, with significant tests and to use good practices.

Read this in other languages: [Portugês](README.pt-br.md)

## Multi Modular

This project has multiple modules, and build it in that way brings many benefits,

- targets each module to it own responsability
- build system takes care of dependency
- easier to deploy the aplication
- deattach and reuse modules in other projects
- ease the migration to microservices

You can see that on `./pom.xml` that we include spring-boot starter dependencies, but on `./infrastructure/pom.xml` we did include only MongoDB ones. Thats because modules works with dependency, they inherance "parent pom" dependencies. Using this strategy, the "infrastructure pom" only needs to import MongoDb dependency. That is a very good pratice, once the sub-modules does not overload themselves with repeted dependencies and when they been detattached and/or reused it forces the envionment to respect the architecture.

A good tip here is the commands that should be runned targeting to main project and the ones that should be directed to each specific module. For example, running the following commands at the root of the project:

```bash
# shoud clean and install all projects dependencies
./mvnw clean install
```

```bash
# shoud run tests only for infrastructure module
./mvnw test -pl infrastructure
```
