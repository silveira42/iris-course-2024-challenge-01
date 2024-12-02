Class core.bo.order.Operation Extends Ens.BusinessOperation
{

XData MessageMap
{
<MapItems>
	<MapItem MessageType="core.bo.order.create.Request">
		<Method>Create</Method>
	</MapItem>
	<MapItem MessageType="core.bo.order.readByDate.Request">
		<Method>ReadByDate</Method>
	</MapItem>
</MapItems>
}

Method Create(pRequest As core.bo.order.create.Request, Output pResponse As core.bo.order.create.Response) As %Library.Status
{
	Return ##class(core.bo.order.create.Method).Execute(##this, pRequest, .pResponse)
}

Method ReadByDate(pRequest As core.bo.order.readByDate.Request, Output pResponse As core.bo.order.readByDate.Response) As %Library.Status
{
	Return ##class(core.bo.order.readByDate.Method).Execute(##this, pRequest, .pResponse)
}

}
