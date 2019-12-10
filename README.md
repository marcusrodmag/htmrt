# htmrt

Este estudo de caso tem como objetivo criar uma stack de infraestrutura que provisiona um ambiente para executar uma aplicação backend rest, com duas réplicas respondendo em um Load Balancer, e uma aplicação frontend estática, ambas respondendo pelo mesmo DNS, porém com contextos distintos.

## Tecnologias utilizadas:

*  	Ambiente Cloud: Google Cloud Platform
*   Terraform - Responsável por criar a infraestrutura (Rede, permissões, regras de firewall e o cluster Kubernetes)
*   Docker - Gerenciador de container
*   Kubernetes - Orquestrador de containers e cluster 
*   NGINX - Webserver utilizado como procedor de conteúdo estático e também como proxy para o backend.
*   Python - Linguagem utilizada no backend
*   Google Cloud Build - Ferramenta utilizada para Integração Contínua (empacotamento e testes automatizados) e Entrega Contínua

## Estrutura de projetos:

- htmrt - Projeto que recebe os formulário terraform e os arquivos de configuração do ambiente Kubernetes (manifest)
- htmrt-backend - Código fonte e instruções de geração de imagem do backend
- htmrt-frontend - Conteúdo estático e configurações do NGINX

## Técnias e boas práticas utilizadas:

- [GitOPS](https://cloud.google.com/kubernetes-engine/docs/tutorials/gitops-cloud-build?hl=pt-br) - Estratégia bastante utilizada por SRE's e visa pipelines CI/CD totalmente orientadas a código, garantido rastreabilidade e versionamento do código fonte, da infraestrutura e das configurações do ambiente.
- Integração contínua - A cada commit, o código é testado e uma imagem Docker gerada.
- Entrega contínua - A cada commit, uma implantação é realizada em um determinado ambiente.
- Rede e segurança: 
  - Um único ip externo para acesso ao cluster
  - Regras de firewall que liberam apenas o acesso a porta 80 do entrypoint
  - Subredes isolando ambientes de desenvolvimento e produção
  - Load Balancer para distribuir o fluxo de requisições entre 02 pods do backend
- Aplicação Web: Uma instância NGINX que redireciona as requisições para o backed e ao mesmo tempo fornece arquivos estáticos referenciados pelo código HTML gerado dinamicamente pelo backend.
- O arquivo contendo as credenciais da Conta de Serviço usadas pela pipeline foi criptografado utilizando a ferramenta  [KMS] (https://cloud.google.com/kms/) e é decriptado durante a execução da pipeline automaticamente.


## Pipeline
Toda a pipeline é acionada através de gatilhos de push do GitHub, de acordo com o branch, sendo:
*   Branch 'development': Implantação no cluster htmrt-dev
*   'Master': Implantação no cluster htmrt-prd

## Instruções para criação da stack
1. Efetuar o clone do projeto https://github.com/marcusrodmag/htmrt.git
2. Fazer checkout na master
3. Adicionar o arquivo htmrt-terraform-sa.json (fornecido via e-mail) em htmrt/key/htmrt-terraform-sa.json
4. Executar a inicialização do Terraform: **terraform init**
5. Selecionar o workspaces de produção: **terraform workspace select prd**
6. Criar o ambiente de produção: **terraform apply**
7. Selecionar o workspaces de desenvolvimento: **terraform workspace select dev**
8. Criar o ambiente de produção: **terraform apply**
9. Efetuar login no projeto GCP: **gcloud auth login marcusrodmag@gmail.com** (Token gerado por demanda)
10. Selecionar o projeto GCP: **gcloud config set project htmrt-260621**
11. Acionar trigers para implantação do ambiente: realizar um commit ou executar as trigers manualmente no [Google Console] (https://cloud.google.com/kms/)

## Acesso ao ambiente
- Desenvolvimento: http://104.198.104.13/
- Produção: http://35.238.105.178/

## Referências
- Source Code Frontend: https://github.com/marcusrodmag/htmrt-frontend.git
- Source Code Backend: https://github.com/marcusrodmag/htmrt-backend.git
- Source Code Infra as Code: https://github.com/marcusrodmag/htmrt.git
- GitOps (CI/CD): 
