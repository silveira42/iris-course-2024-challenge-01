Class erp.bp.order.create.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "erp.bp.order.create.Response";

Property Order As %Library.String(MAXLEN = "");

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Order</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
