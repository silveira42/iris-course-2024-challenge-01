Class core.bs.order.create.Service Extends Ens.BusinessService
{

Method OnProcessInput(pRequest As core.bs.order.create.Request, Output pResponse As core.bs.order.create.Response) As %Library.Status
{
	Try {
		Do pRequest.NewResponse(.pResponse)
	} Catch (exception) {
		Return exception.AsStatus()
	}

	Try {
		Set bpRequest = ##class(core.bp.order.create.Request).%New()
		Set bpRequest.Order = pRequest.Order

		$$$ThrowOnError(..SendRequestSync("Create Order Log", bpRequest, .bpResponse))

		Set pResponse.OrderLog = pRequest.OrderLog
	} Catch (exception) {
		Return exception.AsStatus()
	}

	Return $$$OK
}

}
