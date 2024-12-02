Class core.bo.order.create.Method [ Abstract ]
{

ClassMethod Execute(pHost As core.bo.order.Operation, pRequest As core.bo.order.create.Request, Output pResponse As core.bo.order.create.Response) As %Library.Status
{
	Try {
		Do pRequest.NewResponse(.pResponse)
	} Catch (exception) {
		Return exception.AsStatus()
	}

	Try {
		Do ##class(core.log.Order).Create(pRequest.Order)
	} Catch (exception)	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

}
