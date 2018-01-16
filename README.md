# YouDo Network

Seja bem-vindo(a) a rede social que conecta pessoas baseando-se em seus interesses!

##### Algumas coisas necessárias para executar o projeto

Para facilitar tanto o deploy, quanto o desenvolvimento, esse projeto roda sobre o Docker. Logo, todos os serviços e dependências estão contidos nesse único projeto. Não se esqueça de instalar o Docker Compose para facilitar ainda mais o deploy.

As versão mínima recomendada para o Docker é a seguinte:

```
Docker version 17.09.0-ce
docker-compose version 1.16.1
```

### Requisitos

Para manter um desempenho satisfatório é necessário uma máquina Linux Dual Core com no mínimo 4GB de memória RAM.

##### Variáveis de ambiente

As seguintes variáveis de ambiente devem ser definidas:

```
DATABASE_DEVELOPMENT_NAME
DATABASE_DEVELOPMENT_HOST
DATABASE_DEVELOPMENT_PORT
DATABASE_DEVELOPMENT_USERNAME
DATABASE_DEVELOPMENT_PASSWORD

DATABASE_TEST_NAME
DATABASE_TEST_HOST
DATABASE_TEST_PORT
DATABASE_TEST_USERNAME
DATABASE_TEST_PASSWORD

DATABASE_PRODUCTION_NAME
DATABASE_PRODUCTION_HOST
DATABASE_PRODUCTION_PORT
DATABASE_PRODUCTION_USERNAME
DATABASE_PRODUCTION_PASSWORD

SECRET_KEY_BASE: # para executar em produçao

AWS_ACCESS_KEY_ID # id da chave de acesso da Amazon AWS
AWS_SECRET_ACCESS_KEY: # auto explicativo... (risos) Essa chave pertence à você e somente à você.
S3_BUCKET_NAME
AWS_REGION
```

Extremamente importante! O projeto só será executado se a variável de ambiente ```ELASTICSEARCH_URL ``` estiver definida corretamente com o host do servidor do Elasticsearch. Exemplo dentro de um container: ```http://172.24.0.1:9200```.

Você também pode criar o arquivo ```config/local_env.yml``` e definir essas variáveis.

Depois de definidas as variáveis de ambiente, rode o seguinte comando para executar as migrações

```
$ docker-compose run web rake db:create db:migrate
```

Finalmente, para ver o YouDo Network em acão, basta executar:

```
$ docker-compose up
```

E tudo certo!

### Arquitetura

O YouDo em produção utiliza os serviços RDS (com o Postgres), S3 (para upload de imagens) e EC2 (para manter o projeto em execução). O Elasticsearch também é usado para pesquisa avançada por usuários e publicações.