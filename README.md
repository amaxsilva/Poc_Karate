# Projeto Karate POC

Este repositório contém um projeto de exemplo usando Karate para testes de API. Este README aborda a instalação, configuração, estrutura de diretórios e geração de relatórios.

## Índice

- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Estrutura das Pastas](#estrutura-das-pastas)
- [Configuração do Karate](#configuração-do-karate)
- [Executando Testes](#executando-testes)
- [Gerando Relatórios](#gerando-relatórios)

## Pré-requisitos

Antes de começar, você precisa ter:

- [Java JDK](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html) (Java 11 ou superior)
- [Apache Maven](https://maven.apache.org/download.cgi)

## Instalação

1. **Clone o repositório:**

   ```bash
   git clone <URL_DO_REPOSITORIO>
   cd karate-poc
   ```

2. **Crie a estrutura de diretórios:**

   ```bash
   mkdir -p src/main/java/com/exemplo/karate
   mkdir -p src/test/java/com/exemplo/karate
   ```

3. **Crie o arquivo `pom.xml`:**

   Crie um arquivo `pom.xml` na raiz do projeto com o seguinte conteúdo:

   ```xml
   <project xmlns="http://maven.apache.org/POM/4.0.0"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
       <modelVersion>4.0.0</modelVersion>

       <groupId>com.exemplo.karate</groupId>
       <artifactId>karate-poc</artifactId>
       <version>1.0-SNAPSHOT</version>
       <packaging>jar</packaging>

       <properties>
           <karate.version>1.4.1</karate.version>
           <junit.version>5.7.0</junit.version>
       </properties>

       <dependencies>
           <dependency>
               <groupId>com.intuit.karate</groupId>
               <artifactId>karate-junit5</artifactId>
               <version>${karate.version}</version>
               <scope>test</scope>
           </dependency>
           <dependency>
               <groupId>org.junit.jupiter</groupId>
               <artifactId>junit-jupiter-api</artifactId>
               <version>${junit.version}</version>
               <scope>test</scope>
           </dependency>
           <dependency>
               <groupId>org.junit.jupiter</groupId>
               <artifactId>junit-jupiter-engine</artifactId>
               <version>${junit.version}</version>
               <scope>test</scope>
           </dependency>
       </dependencies>

       <build>
           <plugins>
               <plugin>
                   <groupId>org.apache.maven.plugins</groupId>
                   <artifactId>maven-surefire-plugin</artifactId>
                   <version>2.22.2</version>
                   <configuration>
                       <reportsDirectory>${project.build.directory}/surefire-reports</reportsDirectory>
                       <includes>
                           <include>**/*Test.java</include>
                           <include>**/*.feature</include>
                       </includes>
                   </configuration>
               </plugin>
           </plugins>
       </build>
   </project>
   ```

## Estrutura das Pastas

A estrutura das pastas do projeto deve ser a seguinte:

```
src
└── test
    └── java
        └── br
            └── com
                └── karate
                    ├── RunKarateTest.java
                    ├── domain
                    │   └── config.yaml
                    └── features
                        ├── goRestTest.feature
                        └── OutroTeste.feature


Este arquivo é responsável por configurar a URL base e o token de autenticação que serão utilizados em seus testes.

## Executando Testes

Para executar os testes, utilize o seguinte comando:

```bash
mvn clean test
```

Se você quiser executar apenas os testes marcados com uma tag específica, use:

```bash
mvn test -D"karate.options=--tags @post"
```

## Gerando Relatórios

Os relatórios dos testes executados serão gerados automaticamente pelo Maven no diretório `target/surefire-reports`. Você pode verificar os arquivos `.txt` e `.xml` nesse diretório para ver os resultados dos testes.

Se você quiser gerar um relatório mais detalhado, adicione o seguinte plugin ao seu `pom.xml`:

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-site-plugin</artifactId>
    <version>3.9.1</version>
    <configuration>
        <reportPlugins>
            <reportPlugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-report-plugin</artifactId>
                <version>3.0.0-M5</version>
            </reportPlugin>
        </reportPlugins>
    </configuration>
</plugin>
```

Depois, execute:

```bash
mvn site
```

Os relatórios de teste estarão disponíveis na pasta `target/site`.

## Contribuindo

Sinta-se à vontade para contribuir com melhorias ou relatórios de bugs.

## Licença

Este projeto é de código aberto e pode ser utilizado livremente.
#   P o c _ K a r a t e  
 