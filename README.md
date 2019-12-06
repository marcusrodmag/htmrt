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

## Tecnologias sugeridas:
Pode-se fazer uso das seguintes tecnologias:
*   Docker
*   Terraform
*   Ansible
*   Kubernetes

OBS: outras ferramentas/soluções são bem vindas também, desde que funcione de forma simples e eficiente.

## Será priorizado:

- Organização
- Qualidade da documentacão
- Uso de ferramentas de automatização
- Elegância na solução proposta
- Simplicidade e eficiência
- Técnicas e boas práticas de segurança
