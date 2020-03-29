# Template de Boas Práticas para aplicações SpringBoot com Java

Este é um simples projeto funcional que eu criei para ser usado como template e consulta na criação de novos projetos. É muito importante tem em mente que meu objetivo é montar uma arquitetura bem estruturada, com testes sgnificativos e utiizar boas práticas.

Leia em outros idiomas: [English](README.md)

## Multi-modular

Este projeto possui vários módulos e construi-los dessa maneira traz muitos benefícios,

- direciona cada módulo para sua própria responsabilidade
- o sistema de compilação cuida da dependência
- mais fácil de implantar a aplicação
- anexar e reutilizar módulos em outros projetos
- facilitar a migração para microsserviços

Observe que no`. /pom.xml`, incluímos dependências do spring-boot starter, mas no`. /infrastructure/pom.xml`, incluímos apenas os do MongoDB. Isso porque os módulos funcionam com dependência, eles herdam dependências do "pom pricipal". Usando essa estratégia, o "pom da infraestrutura" precisa apenas importar a dependência do MongoDb. Essa é uma prática muito boa pois, uma vez que os submódulos não se sobrecarregam com dependências repetidas, quando são reutilizados, forçam o ambiente a respeitar a arquitetura modular.

Uma boa dica aqui são os comandos que devem ser executados visando o projeto principal e os que devem ser direcionados para cada módulo específico. Por exemplo, rodando os comando a seguir na raiz do projeto:

```bash
# deve limpar e instalar as dependencias em todos os modulos
./mvnw clean install
```

```bash
# deve executar os testes apenas para o módulo de infraestrutura
./mvnw test -pl infrastructure
```
