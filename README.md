# htmrt

Stack de infraestrutura que provisiona um ambiente para rodar uma aplicação backend rest, com duas réplicas respondendo em um Load Balancer, e uma aplicação frontend estática, ambas respondendo pelo mesmo DNS, porém com contextos distintos.

## Requisitos:

- Ambiente Cloud (AWS, Google, Azure, etc)
- Infraestrutura básica de rede (firewall, subnets, etc)
- Load Balancer
- Aplicação Web: pode ser qualquer tipo de aplicação que demonstre a utilização de Docker e conteúdo estático
- Resolução de DNS para o Load Balancer
- Automatização do processo de build da Aplicação Web e implantação de todos os recursos no serviço cloud utilizado
- Documentação detalhada e instruções para execução em ambiente real (produção e desenvolvimento).

## Tecnologias utilizadas:

*   Terraform
*   Docker
*   Kubernetes
*   Ansible

## Foi priorizado:

- Organização
- Qualidade da documentacão
- Uso de ferramentas de automatização
- Elegância na solução proposta
- Simplicidade e eficiência
- Técnicas e boas práticas de segurança

## Referências
- Source Code Frontend: https://github.com/marcusrodmag/htmrt-frontend.git
- Source Code Backend: https://github.com/marcusrodmag/htmrt-backend.git
- Source Code Infra as Code: https://github.com/marcusrodmag/htmrt.git
- GitOps (CI/CD): https://cloud.google.com/kubernetes-engine/docs/tutorials/gitops-cloud-build?hl=pt-br
- Load Balancer DOCs:
* https://kubernetes.io/docs/tasks/access-application-cluster/connecting-frontend-backend/
* https://github.com/googlesamples
* https://github.com/terraform-google-modules/terraform-google-lb-http/tree/master/examples/https-gke
