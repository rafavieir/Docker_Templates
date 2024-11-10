# Etapa 1: Usar a imagem do Maven para compilar a aplicação
FROM maven:3.8.6-openjdk-17-slim AS build

# Definir o diretório de trabalho
WORKDIR /app

# Copiar o arquivo pom.xml para o contêiner
COPY pom.xml .

# Baixar as dependências (não copia o código ainda)
RUN mvn dependency:go-offline

# Copiar o código-fonte para o contêiner
COPY src /app/src

# Construir a aplicação
RUN mvn clean package -DskipTests

# Etapa 2: Usar a imagem JDK para rodar a aplicação
FROM openjdk:17-jdk-slim

# Definir o diretório de trabalho
WORKDIR /app

# Copiar o JAR gerado da etapa de build
COPY --from=build /app/target/spring-boot-app.jar /app/spring-boot-app.jar

# Expor a porta que o Spring Boot usa (padrão: 8080)
EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java", "-jar", "/app/spring-boot-app.jar"]
