Class erp.bs.order.create.Service Extends Ens.BusinessService
{

Method OnProcessInput(pRequest, Output pResponse) As %Library.Status
{
	// Recuperar data do pedido mais recente da execução anterior

	// Ler a tabela de logs para ver os pedidos que ainda não foram processados

	// Salvar data do pedido mais recente

	// Ler os pedidos recuperados e enviá-los individualmente ao BP

    Return $$$OK
}
}
