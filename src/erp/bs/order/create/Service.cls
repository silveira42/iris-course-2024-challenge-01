Class erp.bs.order.create.Service Extends Ens.BusinessService
{

Method OnProcessInput(pRequest As %Library.RegisteredObject, Output pResponse As %Library.RegisteredObject) As %Library.Status
{
	// Recuperar data do pedido mais recente da execução anterior
	If ($GET(^erpLastOrderDate) = "")
	{
		Set ^erpLastOrderDate = $HOROLOG
	}

	Set lastOrderDate = ^erpLastOrderDate

	// Ler a tabela de logs para ver os pedidos que ainda não foram processados
	Try {
		Set orderLogs = ..ReadOrderLogs(lastOrderDate, .newLastOrderDate)
	} Catch (exception) {
		Return exception.AsStatus()
	}

	// Salvar data do pedido mais recente
	Set ^erpLastOrderDate = newLastOrderDate

	// Ler os pedidos recuperados e enviá-los individualmente ao BP
	Try {
		For i=1:1:orderLogs.Count() {
			#Dim orderLog As core.obj.Order = orderLogs.GetAt(i)

			Set bpRequest = ##class(erp.bp.order.create.Request).%New()
			Set bpRequest.Order = orderLog.Payload

			Try {
				$$$ThrowOnError(..SendRequestSync("Erp Create Order", bpRequest, .bpResponse))
			} Catch (exception) {
				// Considerar formas de reprocessar os pedidos que falharam
				$$$LOGERROR(exception.DisplayString())
				Continue
			}
		}
	} Catch (exception) {
		Return exception.AsStatus()
	}

    Return $$$OK
}

Method ReadOrderLogs(pLastOrderDate As %Library.String, Output pNewLastOrderDate As %Library.String) As %Collection.ListOfObj [ Private ]
{
	Set orderLogsRequest = ##class(core.bo.order.readByDate.Request).%New()

	Set orderLogsRequest.DateTime = pLastOrderDate

	$$$ThrowOnError(..SendRequestSync("Log Order", orderLogsRequest, .orderLogsResponse))

	#Dim orderLogs As %Collection.ListOfObj = orderLogsResponse.Orders

	Set lastOrder = orderLogs.GetAt(orderLogs.Count())

	Set pNewLastOrderDate = lastOrder.CreatedAt

	Return orderLogs
}

}
