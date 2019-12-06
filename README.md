# htmrt

Este estudo de caso tem como objetivo criar uma stack de infraestrutura que provisiona um ambiente para executar uma aplicação backend rest, com duas réplicas respondendo em um Load Balancer, e uma aplicação frontend estática, ambas respondendo pelo mesmo DNS, porém com contextos distintos.

## Ferramentas utilizadas:

- Ambiente Cloud: Google Cloud Platform
- Infraestrutura básica de rede: 
*   Um único ip externo para acesso ao cluster (e resolução DNS)
*   Regras de firewall que liberam apenas o acesso a porta 80 do entrypoint
*   Subredes isolando ambientes de desenvolvimento e produção
- Load Balancer para distribuir o fluxo de requisições entre 02 pods do backend
- Aplicação Web: Um unico pod usando NGINX que redireciona as requisições para o backed e ao mesmo tempo fornece arquivos estáticos CSS e imagens referenciados pelo código HTML gerado dinamicamente pelo backend. 
- Processo de build automatizado, acionados através de gatilhos que monitoram as alterações no repositório de código fonte (GITHUB), gerando imagens docker e realizando sua implantação no Kubernetes de acordo com o branch alterado.
*   Branch Desenvolvimento: Implantação no cluster DEV
*   Master: Implantação no ambiente de PRD

## Tecnologias utilizadas:

*   Terraform - Responsável por criar a infraestrutura (Rede, permissões, regras de firewall e o cluster Kubernetes)
*   Docker - Gerenciador de container
*   Kubernetes - Orquestrador de containers
*   Skaffold - Ferramenta utilizada para automatizar a implantação em ambiente de testes
*   NGINX - Webserver utilizado como procedor de conteúdo estático e também como proxy para o backend.
*   Python - Linguagem utilizada no backend
*   Google Cloud Build - Ferramenta utilizada para Integração Contínua (empacotamento e testes automatizados) e Entrega Contínua

<<<<<<< HEAD
=======
## Será priorizado:
>>>>>>> branch 'master' of https://github.com/marcusrodmag/htmrt.git

## Estrutura de projetos:

- htmrt - Projeto que recebe os formulário terraform e os arquivos de configuração do Kubernetes (manifest)
- htmrt-backend - Código fonte e instruções de geração de imagem do backend
- htmrt-frontend - Conteúdo estático e configuração do NGINX

## Técnias e boas práticas utilizadas:

- GitOPS
- Integração contínua
- Entrega contínua


## Referências
- Source Code Frontend: https://github.com/marcusrodmag/htmrt-frontend.git
- Source Code Backend: https://github.com/marcusrodmag/htmrt-backend.git
- Source Code Infra as Code: https://github.com/marcusrodmag/htmrt.git
- GitOps (CI/CD): https://cloud.google.com/kubernetes-engine/docs/tutorials/gitops-cloud-build?hl=pt-br
- Load Balancer DOCs:
* https://kubernetes.io/docs/tasks/access-application-cluster/connecting-frontend-backend/
* https://github.com/googlesamples
* https://github.com/terraform-google-modules/terraform-google-lb-http/tree/master/examples/https-gke
