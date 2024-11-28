Class core.bo.payment.Operation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

XData MessageMap
{
<MapItems>
	<MapItem MessageType="core.bo.payment.readByDate.Request">
		<Method>ReadByDate</Method>
	</MapItem>
	<MapItem MessageType="core.bo.payment.create.Request">
		<Method>Create</Method>
	</MapItem>
</MapItems>
}

Method ReadByDate(pRequest As core.bo.payment.readByDate.Request, Output pResponse As core.bo.payment.readByDate.Response) As %Library.Status
{
    Return ##class(core.bo.payment.readByDate.Method).Execute(##this, pRequest, .pResponse)
}

Method Create(pRequest As core.bo.payment.create.Request, Output pResponse As core.bo.payment.create.Response) As %Library.Status
{
    Return ##class(core.bo.payment.create.Method).Execute(##this, pRequest, .pResponse)
}

}
