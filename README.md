# Docker_Templates Repository

Este repositório contém uma coleção de `Dockerfile` organizados para diferentes cenários e tecnologias, facilitando a criação de ambientes de desenvolvimento, teste e produção. Cada linguagem tem sua própria pasta, com exemplos específicos de `Dockerfile` para configurações de desenvolvimento, produção e opções de shell interativo.

## Estrutura do Repositório

Para cada linguagem, você encontrará uma pasta contendo os seguintes arquivos:

- **`.dev`**: Configurações para um ambiente de desenvolvimento, frequentemente com recursos como hot reload.
- **`.prod`**: Configurações otimizadas para produção, visando desempenho e segurança.
- **`.shell`**: Ambiente com shell interativo para realizar configurações adicionais manualmente.

Explore os Dockerfile e crie ambientes personalizados para suas necessidades. Este repositório é ideal para desenvolvedores que precisam de configurações otimizadas e fáceis de adaptar para seus projetos em Docker.

## Exemplo de Uso

```bash
git clone https://github.com/seu-usuario/Docker_Templates.git
cd Docker_Templates/litespeed/
docker build -t litespeed_dev -f Dockerfile.dev .
docker run -p 8088:8088 litespeed_dev
```
Boa criação de containers! 🚀

