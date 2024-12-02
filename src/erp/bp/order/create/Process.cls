Class erp.bp.order.create.Process Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As erp.bp.order.create.Request, Output pResponse As erp.bp.order.create.Response) As %Library.Status
{
    Try
    {
        $$$ThrowOnError(pRequest.NewResponse(.pResponse))
    }
    Catch (exception)
    {
        Return exception.AsStatus()
    }

	Try
	{
		$$$ThrowOnError(..CreateOrder(pRequest.Order))
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

    Return $$$OK
}

Method CreateOrder(pOrder As %Library.String) As %Library.Status
{
    // Transformar dados do BS em dados do BO
	Try
	{
		Set dynamicOrder = ##class(%Library.DynamicObject).%FromJSON(pOrder)
		$$$ThrowOnError(##class(erp.dt.order.Transform).Transform(dynamicOrder, .order))
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

    // Chamar o BO
	Try
	{
		Set boRequest = ##class(erp.bo.order.create.Request).%New()
		Set boRequest.Order = order

		$$$ThrowOnError(..SendRequestSync("Erp Order", boRequest, .boResponse))
		#Dim boResponse As erp.bo.order.create.Response
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

    Return $$$OK
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
