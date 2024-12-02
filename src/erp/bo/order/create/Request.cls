Class erp.bo.order.create.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "erp.bo.order.create.Response";

Property Order As erp.obj.Order;

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
