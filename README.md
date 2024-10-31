Aqui está o seu `README.md` atualizado com as informações sobre hot reload e os comandos correspondentes:

```markdown
# Docker_Templates Repository

Este repositório contém uma coleção de `Dockerfile` organizados para diferentes cenários e tecnologias, facilitando a criação de ambientes de desenvolvimento, teste e produção. Cada linguagem tem sua própria pasta, com exemplos específicos de `Dockerfile` para configurações de desenvolvimento, produção e opções de shell interativo.

## Estrutura do Repositório

Para cada linguagem, você encontrará uma pasta contendo o arquivo Dockerfile e o diretório de aplicação.

Explore os Dockerfile e crie ambientes personalizados para suas necessidades. Este repositório é ideal para desenvolvedores que precisam de configurações otimizadas e fáceis de adaptar para seus projetos em Docker.

## Hot Reload

Para facilitar o desenvolvimento, você pode habilitar o hot reload, que permite que as alterações nos arquivos sejam refletidas imediatamente no contêiner. Para usar o hot reload, execute o seguinte comando:

```bash
docker run -p 8088:8088 -v $(pwd)/public_html:/usr/local/lsws/Example/html litespeed_dev
```

### Executando sem Hot Reload

Se preferir não usar hot reload, você pode simplesmente executar o contêiner sem montar volumes. Isso é recomendado para ambientes de produção, onde a estabilidade e o desempenho são mais importantes. O comando seria:

```bash
docker run -p 8088:8088 litespeed_dev
```

### Recomendações sobre Hot Reload

- O hot reload é ótimo para desenvolvimento, pois acelera o ciclo de feedback e permite que você veja as alterações instantaneamente.
- No entanto, em ambientes de produção, é recomendado desativar o hot reload para evitar problemas de desempenho e garantir que a versão estável do seu aplicativo esteja em execução.

## Exemplo de Uso

```bash
git clone https://github.com/seu-usuario/Docker_Templates.git
cd Docker_Templates/litespeed/
docker build -t litespeed_dev -f Dockerfile.dev .
# Para usar hot reload
docker run -p 8088:8088 -v $(pwd)/public_html:/usr/local/lsws/Example/html litespeed_dev
# Para execução sem hot reload (recomendado para produção)
docker run -p 8088:8088 litespeed_dev
```

Boa criação de containers! 🚀
