# Integração ERP e Marketplace - Desafio de Desenvolvimento Orientado a Eventos

## Descrição do Projeto

Este repositório contém a base do desafio proposto no treinamento de **Desenvolvimento em Intersystems IRIS - Bridger**, focado na construção de uma integração entre um **ERP** e um **Marketplace**. O objetivo é desenvolver um consumidor e um produtor de eventos, simulando um fluxo de dados entre os dois sistemas.

### Objetivo

Cada aluno deverá implementar a solução, desenvolvendo produtores e consumidores de eventos para sincronizar uma das seguintes entidades entre o ERP e o Marketplace:

1. **Produto**
2. **Pedido**
3. **Cliente**
4. **Pagamento**
5. **Envio**

## Estrutura do Repositório

- **/spec**: Contém as especificações das APIs em formato OpenAPI 3.0 para o ERP e o Marketplace.
  - `erpOpenapi.yml`: Especificação da API do ERP.
  - `marketplaceOpenapi.yml`: Especificação da API do Marketplace.
  - `integratorOpenapi.yml`: Especificação da API do Integrador que será desenvolvido.

## Como Usar

### 1. Fazer um Fork do Repositório

Cada aluno deve fazer um fork deste repositório para começar o desenvolvimento da solução.

### 2. Implementar os Eventos

Você deverá implementar um sistema de mensagens baseado em eventos para um dos seguintes fluxos:

- **Produto**: Sincronizar os dados de produtos entre ERP e Marketplace.
- **Pedido**: Sincronizar e processar pedidos realizados no Marketplace para o ERP.
- **Cliente**: Sincronizar clientes criados no ERP e no Marketplace.
- **Pagamento**: Processar e registrar pagamentos no ERP e no Marketplace.
- **Envio**: Atualizar status de envio dos pedidos.

### 3. Consumidor e Produtor de Eventos

Implemente tanto o **consumidor** quanto o **produtor** de eventos para cada uma das entidades. Isso deve ser feito seguindo o formato de dados fornecido pelos arquivos de especificação OpenAPI 3.0 (`erpOpenapi.yml` e `marketplaceOpenapi.yml`).

### 4. Submeter a Solução

Após implementar as soluções, envie um Pull Request (PR) com a sua solução para revisão.

## Especificações Técnicas

As APIs seguem o padrão OpenAPI 3.0 e estão documentadas nos arquivos YAML fornecidos. Utilize-os como base para estruturar seus eventos e garantir que o fluxo de informações entre ERP e Marketplace seja realizado corretamente.

## Estrutura dos JSONs

Para os formatos dos eventos, utilize como base os JSONs especificados nas APIs e adapte conforme necessário para seu sistema de mensagens:

- [Formato JSON para ERP](./spec/erpOpenapi.yml)
- [Formato JSON para Marketplace](./spec/marketplaceOpenapi.yml)
- [Formato JSON para Integrador que será desenvolvido](./spec/integratorOpenapi.yml)

---

**Boa sorte no desafio!**
