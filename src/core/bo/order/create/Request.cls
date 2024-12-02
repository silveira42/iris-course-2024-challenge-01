Class core.bo.order.create.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "core.bo.order.create.Response";

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
