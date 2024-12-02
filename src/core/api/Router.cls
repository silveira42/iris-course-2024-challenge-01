Class core.api.Router Extends %CSP.REST
{

/// Description
XData UrlMap
{
<Routes>
	<Route Url="/order" Method="POST" Call="CreateOrder"/>
</Routes>
}

ClassMethod CreateOrder() As %Library.Status
{
	Try {
		$$$ThrowOnError(##class(Ens.Director).CreateBusinessService("Rest Create Order Log", .service))
	} Catch (exception) {
		Return exception.AsStatus()
	}

	Set order = ""

	While ('%request.Content.AtEnd)
	{
		Set order = order _ $ZCONVERT(%request.Content.Read(), "I", "UTF8")
	}

	Set bsRequest = ##class(core.bs.order.create.Request).%New()

	Set bsRequest.Order = order

	Try {
		$$$ThrowOnError(service.ProcessInput(bsRequest, .bsResponse))
		#Dim bsResponse As core.bs.order.create.Response
	} Catch (exception) {
		Return exception.AsStatus()
	}

	Set %response.Status = ..#HTTP201CREATED
	Do bsResponse.OrderLog.%JSONExportToString(.responseString)

	Write responseString

	Return $$$OK
}

}
