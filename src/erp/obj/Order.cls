Class erp.obj.Order Extends (%Library.SerialObject, %JSON.Adaptor, %XML.Adaptor)
{

Property OrderId As %Library.String(%JSONFIELDNAME = "orderId", MAXLEN = 50) [ Required ];

Property CustomerId As %Library.String(%JSONFIELDNAME = "customerId", MAXLEN = 50) [ Required ];

Property Products As list Of erp.obj.Product;

Property TotalValue As %Library.Float(%JSONFIELDNAME = "totalValue") [ Required ];

Property Status As %Library.String(%JSONFIELDNAME = "status", MAXLEN = "") [ Required ];

Storage Default
{
<Data name="OrderState">
<Value name="1">
<Value>OrderId</Value>
</Value>
<Value name="2">
<Value>CustomerId</Value>
</Value>
<Value name="3">
<Value>Products</Value>
</Value>
<Value name="4">
<Value>TotalValue</Value>
</Value>
<Value name="5">
<Value>Status</Value>
</Value>
</Data>
<State>OrderState</State>
<StreamLocation>^erp.obj.OrderS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
