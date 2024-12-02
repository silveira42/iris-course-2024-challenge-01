Class core.bp.order.create.Process Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As core.bo.order.create.Request, Output pResponse As core.bo.order.create.Response) As %Library.Status
{
	Try {
		Set orderLog = ..CreateOrder(pRequest.Order, .pResponse)
		Set pResponse.OrderLog = orderLog
	} Catch (exception) {
		Return exception.AsStatus()
	}

	Return $$$OK
}

Method CreateOrder(pOrder As %Library.String) As core.obj.Order [ Private ]
{
	Set orderRequest = ##class(core.bo.order.create.Request).%New()
	Set orderRequest.Order = pOrder

	$$$ThrowOnError(..SendRequestSync("Log Order", orderRequest, .orderResponse))
	#Dim orderResponse As core.bo.order.create.Response

	Return orderResponse.Order
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
