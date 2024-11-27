Class erp.bo.order.Operation Extends Ens.BusinessOperation
{

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

XData MessageMap
{
<MapItems>
	<MapItem MessageType="erp.bo.order.create.Request">
		<Method>Create</Method>
	</MapItem>
</MapItems>
}

Method Create(pRequest As erp.bo.order.create.Request, Output pResponse As erp.bo.order.create.Response) As %Library.Status
{
    Return ##class(erp.bo.order.create.Method).Execute(##this, pRequest, .pResponse)
}

}
