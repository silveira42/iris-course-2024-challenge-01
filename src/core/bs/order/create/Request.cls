Class core.bs.order.create.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "core.bs.order.create.Response";

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
