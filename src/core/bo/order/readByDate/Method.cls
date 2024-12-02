Class core.bo.order.readByDate.Method [ Abstract ]
{

ClassMethod Execute(pHost As core.bo.order.Operation, pRequest As core.bo.order.readByDate.Request, Output pResponse As core.bo.order.readByDate.Response) As %Library.Status
{
	Try {
		Do pRequest.NewResponse(.pResponse)
	} Catch (exception) {
		Return exception.AsStatus()
	}

	Try {
		Set orderLogs = ##class(core.log.Order).ReadByDate(pRequest.DateTime, .pResponse)
	} Catch (exception)	{
		Return exception.AsStatus()
	}

	Set orderObjs = ##class(%Collection.ListOfObj).%New()

	For i=1:1:orderLogs.Count() {
		Set orderObj = ##class(core.obj.Order).FromLog(orderLogs.GetAt(i))

		Do orderObjs.Insert(orderObj)
	}

	Set pResponse.Orders = orderObjs

	Return $$$OK
}

}
