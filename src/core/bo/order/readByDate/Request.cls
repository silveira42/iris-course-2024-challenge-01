Class core.bo.order.readByDate.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "core.bo.order.readByDate.Response";

Property DateTime As %Library.TimeStamp;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>DateTime</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
